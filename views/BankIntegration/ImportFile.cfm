
<style> 

.uploadbox {
size: 292;
} 

</style>
<cfoutput> 
	<DIV>
#startFormTag(controller="BankIntegration", action="TransactionImport", method="POST", enctype="multipart/form-data")#
#select(objectName="SMBankTransFileImport",property="AccountID", options="#qBankAccounts#")#<BR> 
#fileField(objectName="SMBankTransFileImport",labelPlacement="Before", property="FileName", label="Import File:",size="50")#

</div>

#submitTag( value="Upload")#

#EndFormTag()#


</cfoutput>


