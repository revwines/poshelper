<cfcomponent extends="Controller" output="false">

	<cffunction name="ImportFile"> 
		
	<cfset SMBankTransFileImport = model("SMBankTransFileImport").new()>
	<cfset qBankAccounts = model("GLAccountBank").findAll(select="AccountID,BankName", where ="ImportEnabled=1")>
	
	</cffunction>
	
	
	<cffunction name = "TransactionImport"> 
	
	<!--- load import instructions--->
		<cfset oGLAccountBank=model("GLAccountBank").findbyKey(params.SMBankTransFileImport.accountID)>
		
		<cfswitch expression="#oGLAccountBank.TransportType#"> 
		
			<cfcase value= "File">
				<cfset OfxImport(FileFormat="#oGLAccountBank.TransportFormat#")>
			</cfcase>
			
			<cfcase value="WsRest"> 
			
			
			</cfcase>
			
			<cfcase value="WsSoap"> 
			
			
			</cfcase>
		
		</cfswitch>
		
		<cfset renderNothing()>
	</cffunction>
	
	<cffunction name="OfxImport" access="private"> 
		<cfargument name="FileFormat" required="TRUE" type="string">
		<!---receives object named oBankImportFile--->
		<cfsetting requesttimeout="180">
	<!--- <cfdump var="#Params#"> --->
		<cfset var loc = {}>
		<!---get import instructions from GLAAccountBank --->
		
		
		<cfset oSMBankTransFileImport=model("SMBankTransFileImport").new(params.SMBankTransFileImport)>
		<!---import file--->
	
		<cfset oSMBankTransFileImport.FileFormat =oGLAccountBank.TransportFormat >
		<cfset oSMBankTransFileImport.Status ="IMPORT">
		
		
		<cfif oSMBankTransFileImport.save()>
			
			<!--- by default cfWheels sticks uploaded files to /Files/--->
			<!--- future enhancement support import file or web service call---->
			<cffile action="read" file="/Files/#oSMBankTransFileImport.FileName#" variable="OfxSGML">
			
			<!--- ofxSMGL should be populated through web call or import at this point--->
			<cfif FileFormat is "OFX102">
				<cfset loc.OfxXml =  oSMBankTransFileImport.ConvertSgmlToXml(OfxSGML)>
			</cfif>
			
			<!--- final step of batch load is to parse xml and load table---->
			
			<cfset loc.ImportStats =LoadOfxBatchTransaction(loc.ofxxml) >
			
			<cfset oSMBankTransFileImport.DuplicatesSkipped ="#loc.ImportStats.DuplicateFitid#">
			<cfset oSMBankTransFileImport.TransactionsProcessed= "#loc.ImportStats.RowsProcessed#">
			<cfset oSMBankTransFileImport.update()>
			

		<cfelse> 
			Save Not successful - 
			<cfdump var="#oSMBankTransFileImport.allErrors()#" abort="TRUE">
			
		</cfif>

		<!--- create and intialize new batch record ---->
	</cffunction>

	<cffunction name = "MergeTransactions"> 
	
	
	</cffunction>

<cffunction name="ImportSummary"> 



</cffunction>


<cffunction name = "LoadOfxBatchTransaction" returntype="struct"> 
	<cfargument name="ofxXml" type="struct" required = "TRUE">

		<!--- 	<cfdump var="#oSMBankTransFileImport.ofxXML#" abort="TRUE"> --->
		
			<!--- Initialize counters and other variables used in control flow --->
			
			<cfset var loc = {}>
			<cfset var loc.ImportStats = {}>
			
			<cfset loc.BankTransactionHeader = {}>
			<cfset loc.ImportStats.duplicateFitid = 0>
			<cfset loc.ImportStats.RowsProcessed=0>
			
			
			<cfset loc.BankTransactionHeader =arguments.ofxXML.xmlRoot.BANKMSGSRSV1.STMTTRNRS.STMTRS>
			
				
			<cfset loc.BankTransDetail = loc.BankTransactionHeader.BANKTRANLIST>
		
			<cfset loc.BankTransactionHeader.BankId = structFind(loc.BankTransactionHeader.BANKACCTFROM,"BANKID")>
			<cfset loc.BankTransactionHeader.AcctID = structFind(loc.BankTransactionHeader.BANKACCTFROM,"AcctID")>
			<cfset loc.BankTransactionHeader.AcctType = structFind(loc.BankTransactionHeader.BANKACCTFROM,"ACCTTYPE")>
			
			<cfset loc.BankId =loc.BankTransactionHeader.BankId.xmlText >
			
			
			
			<!--- Begin loop over transaction detail --->
		
			<cfloop from="1" to ="#arraylen(loc.BankTransDetail.xmlChildren)#" index ="trn"> 
				<cfif loc.BankTransDetail.xmlChildren[trn].xmlName is "STMTTRN">
					
					
					<!--- set  transaction structure--->
					<cfset loc.STMTTRN = loc.BankTransDetail.xmlChildren[trn] >
					
					
					<cfset SMBankTransactionDetail = model("SMBankTransactionDetail").new()>
					
					
					<cfset SMBankTransactionDetail.BankTransactionBatchID = oSMBankTransFileImport.BankTransactionBatchID>	
					<cfset SMBankTransactionDetail.AccountID = oSMBankTransFileImport.AccountId>
					<cfset SMBankTransactionDetail.FITID = structfind(loc.STMTTRN,"FITID").xmlText>
					<cfset SMBankTransactionDetail.TranAmount = structFind(loc.STMTTRN,"TRNAMT").xmlText>
					<cfset SMBankTransactionDetail.Name = structFind(loc.STMTTRN,"Name").xmlText>
					<cfset SMBankTransactionDetail.TranType =structFind(loc.STMTTRN,"TRNTYPE").xmlText> 
					<cfset loc.PostedDate = left(structFind(loc.STMTTRN,"DTPOSTED").xmlText,8)>
					
					<cfset SMBankTransactionDetail.PostedDate = ISOToDateTime(loc.PostedDate)>
					
					<cfswitch  expression="#SMBankTransactionDetail.TranType#">
						<cfcase value="CHECK">
							<cfset SMBankTransactionDetail.CheckNum =structFind(loc.STMTTRN,"CHECKNUM").xmlText>
						</cfcase>
					</cfswitch>
						
					<cftry>
						<cfset SMBankTransactionDetail.BankMemo =structFind(loc.STMTTRN,"MEMO").xmlText>
						<!--- Credit types don't have a memo----
						This logic might change in the future --->
						<cfcatch type="any">
							<cfset SMBankTransactionDetail.BankMemo ="Credit">
						</cfcatch>
					</cftry>
					
				
					<cfset SMBankTransactionDetail.BankId = trim(loc.BankTransactionHeader.BankId.xmlText) >
					
					<cfif SMBankTransactionDetail.save()>
						<cfset loc.ImportStats.RowsProcessed = loc.ImportStats.RowsProcessed + 1>
					<cfelse>
							<cfif SMBankTransactionDetail.hasErrors("Fitid")> 
								<cfset loc.ImportStats.DuplicateFitid = loc.ImportStats.DuplicateFitid + 1>
							<cfelse>
								<cfdump var="#SMBankTransactionDetail#" abort="TRUE">
							</cfif> 
					
					</cfif>
				</cfif>
			</cfloop>
				 
		
		<!--- 	<cfset SMBankTransFileImport.DuplicatesIngored =DuplicateFitid > --->

			
			<!--- <cfdump var="#oSMBankTransFileImport#" abort="TRUE"> --->
			<cfreturn loc.ImportStats>

</cffunction>

</cfcomponent>