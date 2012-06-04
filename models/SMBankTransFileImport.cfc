<cfcomponent extends="Model" output="false" hint="I log bank transaction file imports">

<cffunction name="init"> 
	
	<cfset var loc =structnew()>
	<cfset loc.mimeTypes.ofx ="application/xml">
	
	
	<cfset table("tblSMBankTransactionBatch")>
	
	<cfset hasMany(name ="SMBankTransActionDetail")>
	<cfset belongsTo(name="GLAccountBank", ForeignKey= "AccountID")>
	
    <cfset uploadableFile(property="FileName", mimeTypes=loc.mimeTypes )> 
	
	
		<cfset property(name="BankTransactionBatchID", column="strBankTransactionBatchID")>
		<cfset property(name="FileName", column="strFileName")>
		<cfset property(name="AccountID", column="strAccountID")>
		<cfset property(name="FileImportDate", column="dtmFileImportDate")>
		<cfset property(name="FileFormat", column="strFileFormat")>
		<cfset property(name="TransactionsProcessed", column="intTransactionsProcessed")>
		<cfset property(name="DuplicatesSkipped", column="intDuplicatesSkipped")>
		<cfset property(name="Status", column="strStatus")>
		<cfset property(name="Duration", column="intDuration")>
		<cfset property(name="DateCreated", column="dtmCreated")>
		<cfset property(name="ValidXml", column="ysnValidXml")>
		<cfset property(name="DuplicateCount", column="intDuplicateCount")>
		<cfset property(name="MatchCount", column="intMatchCount")>
		<cfset property(name="NewCount", column="intNewCount")>
		<cfset property(name="CheckBookReviewComplete", column="ysnCheckBookReviewComplete")>
		<cfset property(name="CheckbookItemsCleared", column="ysnCheckbookItemsCleared")>
		<cfset property(name="CheckbookIDStart", column="strCheckbookIDStart")>
		<cfset property(name="CheckbookIDEnd", column="strCheckbookIDEnd")>
	
	<!--- callbacks --->
<!--- 	<cfset afterSave("convertXML")> --->
	
	<cfset afterNew("NewBatchID")>
	
</cffunction>

<cffunction name = "ConvertSgmlToXml" returntype="any">
	<cfargument name="SgmlString" required="TRUE" type="string" >

	<!---- Convert OFX v1.* to standard XML--->

		<cfset var  loc = {}>
		<cfset loc.isValidFile = FALSE>
		
<!--- 		<cfset loc.FQFile = "/Files/#this.FileName#">
		
		<cffile action="read" file="/Files/#this.FileName#" variable="Trans"> --->
		
		<!--- <cfset regEx = reFind("<[A-Z]+>\w+[\n]",trans,1,0)> --->
		<cfset loc.XmlString = reReplace(SgmlString,"<([A-Z]+)>([\S\w ]+)\n","<\1>\2</\1>#chr(13)#","ALL")>
		
		
		<!---- OFX 1.x markup contains header information in thee form: 
				OFXHEADER:100
				DATA:OFXSGML
				VERSION:102
				SECURITY:NONE
				ENCODING:USASCII
				CHARSET:1252
				COMPRESSION:NONE
				OLDFILEUID:NONE
				NEWFILEUID:NONE
				
			Transform to 
			
			<OFX OFXHEADER="100"
				DATA="OFXSGML"
				VERSION="102"
				SECURITY="NONE"
				ENCODING="USASCII"
				CHARSET="1252"
				COMPRESSION="NONE"
				OLDFILEUID="NONE"
				NEWFILEUID="NONE">
		---->
		
		<cfset rex ="OFXHEADER:([A-Za-z0-9]+).*DATA:([A-Za-z0-9]+).*VERSION:([A-Za-z0-9]+).*SECURITY:([A-Z]+).*ENCODING:([A-Z]+).*CHARSET:([0-9]+).*COMPRESSION:([A-Z]+).*OLDFILEUID:([A-Z]+).*NEWFILEUID:([A-Z]+).*<OFX>">
					<!---COMPRESSION:([A-Z]+)/n
						OLDFILEUID:([A-Z]+)/n
						NEWFILEUID:([A-Z]+)/n
						.*<OFX>"> --->
						
		<cfset loc.XmlString =reReplace(loc.XmlString,rex,'<OFX OFXHEADER="\1" DATA="\2" VERSION="\3" SECURITY="\4" ENCODING="\5" CHARSET="\6" COMPRESSION="\7" OLDFILEUID="\8" NEWFILEUID="\9">')>
		
		 
	
	
		<cfif isXML(loc.XmlString)>
			<cfset loc.OfxXml = XMLParse(loc.XmlString)>
		<cfelse> 
			<cfset loc.OfxXml= FALSE>
		</cfif>
		<!--- #Mid(trans,regEx,50)# --->
		
		<!--- <cfset TranList = xm.xmlRoot.BANKMSGSRSV1.STMTTRNRS.STMTRS.BANKTRANLIST.xmlChildren> --->
		
		<!--- <cfdump var="#Tranlist#"> --->
	
	
	<cfreturn loc.OfxXml>
	

</cffunction>

<cffunction name="NewBatchId" access="private"> 

	<cfset this.BankTransactionBatchID = GetStartingNumber(this.columnForProperty("BankTransactionBatchID"))>


</cffunction>

</cfcomponent>