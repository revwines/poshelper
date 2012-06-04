<cfcomponent extends="Model" output="false">

<cffunction name="init"> 

	<cfset table("tblGLAccountBank")>
	
	<!---- associations ---->
	
	<cfset hasMany(name="SMBankTransFileImport")>
	
	<Cfset hasMany(name= "SMBankTransactionDetail")>

	<cfset property(name="AccountID", column="strAccountID")>
	<cfset property(name="BankName", column="strBankName")>
	<cfset property(name="AccountNumber", column="strAccountNumber")>
	<cfset property(name="NameOnAccount", column="strNameOnAccount")>
	<cfset property(name="Contact", column="strContact")>
	<cfset property(name="Address", column="strAddress")>
	<cfset property(name="County", column="strCounty")>
	<cfset property(name="City", column="strCity")>
	<cfset property(name="State", column="strState")>
	<cfset property(name="Zip", column="strZip")>
	<cfset property(name="Country", column="strCountry")>
	<cfset property(name="Phone", column="strPhone")>
	<cfset property(name="Fax", column="strFax")>
	<cfset property(name="InterestRate", column="strInterestRate")>
	<cfset property(name="Comments", column="strComments")>
	<cfset property(name="ReconcileOpeningBalance", column="dblReconcileOpeningBalance")>
	<cfset property(name="CheckNumber", column="strCheckNumber")>
	<cfset property(name="ExpDate", column="dtmExpDate")>
	<cfset property(name="CompName", column="strCompName")>
	<cfset property(name="CompAddress", column="strCompAddress")>
	<cfset property(name="BankInfo", column="strBankInfo")>
	<cfset property(name="MICRLine", column="strMICRLine")>
	<cfset property(name="WebLinkEnabled", column="ysnWebLinkEnabled")>
	<cfset property(name="ImportEnabled", column="ysnImportEnabled")>
	<cfset property(name="TransportFormat", column="strTransportFormat")>
	<cfset property(name="WebLinkUserName", column="strWebLinkUserName")>
	<cfset property(name="WebLinkPassword", column="strWebLinkPassword")>
	<cfset property(name="LastPostDateProcessed", column="dtmLastPostDateProcessed")>
	<cfset property(name="DefaultUploadDirectory", column="strDefaultUploadDirectory")>
	<cfset property(name="DefaultUploadFileName", column="strDefaultUploadFileName")>
	<cfset property(name="WebLinkURL", column="strWebLinkURL")>
	<cfset property(name="OverwriteOnUpload", column="ysnOverwriteOnUpload")>

</cffunction>
</cfcomponent>