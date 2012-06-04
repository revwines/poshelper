<cfcomponent extends="Model" output="false">

	<cffunction name="Init"> 
			
		<cfset table("tblSMBankTransactionDetail")>
		
		<cfset belongsTo(name="SMBankTranFileImport", foreignKey="BankTransactionBatchID")>
		
		<cfset belongsTo(name="GLAccountBank", ForeignKey= "AccountID")>
		
		<cfset validatesUniquenessOf(properties="fitid", message="FITID-DUP")>
		
		<cfset property(name="BankTransactionDetailID", column = "strBankTransactionDetailID")>
		<cfset property(name="Fitid", column="strFitid")>
		<cfset property(name="AccountID", column="strAccountID")>
		<cfset property(name="FileName", column="strFileName")>
		<cfset property(name="BankTransactionBatchID", column="strBankTransactionBatchID")>
		<cfset property(name="createdat", column="dtmProcessDate")>
		<cfset property(name="PostedDate", column="dtmPostedDate")>
		<cfset property(name="Name", column="strName")>
		<cfset property(name="BankMemo", column="strBankMemo")>
		<cfset property(name="TranType", column="strTranType")>
		<cfset property(name="TranAmount", column="curTranAmount")>
		<cfset property(name="CheckNum", column="strCheckNum")>
		<cfset property(name="CurDef", column="strCurDef")>
		<cfset property(name="BankID", column="strBankID")>
		<cfset property(name="AcctID", column="strAcctID")>
		<cfset property(name="AcctType", column="strAcctType")>
		<cfset property(name="Matched", column="ysnMatched")>
		<cfset property(name="MatchCheckbookID", column="strMatchCheckbookID")>
		
		<cfset afterNew("GetID")>
		
		
		
	</cffunction>


	<cffunction name="GetID"> 
	
		<cfset this.BankTransactionDetailID = GetStartingNumber(this.columnForProperty("BankTransactionDetailID"))>
	
	</cffunction>
</cfcomponent>