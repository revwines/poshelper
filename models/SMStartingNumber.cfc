<cfcomponent extends="Model" output="false">
	<cffunction name = "Init"> 
	
		<cfset table("tblSMStartingNumber")>
	
		<cfset property(name="InvoiceNumber", column="strInvoiceNumber")>
		<cfset property(name="OrderNumber", column="strOrderNumber")>
		<cfset property(name="BackOrderNumber", column="strBackOrderNumber")>
		<cfset property(name="QuoteNumber", column="strQuoteNumber")>
		<cfset property(name="ReceivableNumber", column="strReceivableNumber")>
		<cfset property(name="CustomerPrepaymentNumber", column="strCustomerPrepaymentNumber")>
		<cfset property(name="FinanceChargeNumber", column="strFinanceChargeNumber")>
		<cfset property(name="BillNumber", column="strBillNumber")>
		<cfset property(name="PurchaseOrderNumber", column="strPurchaseOrderNumber")>
		<cfset property(name="GeneralJournalNumber", column="strGeneralJournalNumber")>
		<cfset property(name="VendorPrepaymentNumber", column="strVendorPrepaymentNumber")>
		<cfset property(name="PayableNumber", column="strPayableNumber")>
		<cfset property(name="InventoryAdjustmentNumber", column="strInventoryAdjustmentNumber")>
		<cfset property(name="InventoryTransferNumber", column="strInventoryTransferNumber")>
		<cfset property(name="InventoryBuildNumber", column="strInventoryBuildNumber")>
		<cfset property(name="CreditCardChargeNumber", column="strCreditCardChargeNumber")>
		<cfset property(name="CreditCardReturnNumber", column="strCreditCardReturnNumber")>
		<cfset property(name="MakeDepositNumber", column="strMakeDepositNumber")>
		<cfset property(name="WriteCheckNumber", column="strWriteCheckNumber")>
		<cfset property(name="PaycheckNumber", column="strPaycheckNumber")>
		<cfset property(name="CustomerID", column="strCustomerID")>
		<cfset property(name="VendorID", column="strVendorID")>
		<cfset property(name="EmployeeID", column="strEmployeeID")>
		<cfset property(name="JobID", column="strJobID")>
		<cfset property(name="ProspectID", column="strProspectID")>
		<cfset property(name="CustomerID", column="ysnCustomerID")>
		<cfset property(name="VendorID", column="ysnVendorID")>
		<cfset property(name="EmployeeID", column="ysnEmployeeID")>
		<cfset property(name="JobID", column="ysnJobID")>
		<cfset property(name="ProspectID", column="ysnProspectID")>
		<cfset property(name="Batch", column="dblBatch")>
		<cfset property(name="LinkedOrders", column="strLinkedOrders")>
		<cfset property(name="BatchPost", column="strBatchPost")>
		<cfset property(name="isCustomerShipID", column="ysnCustomerShipID")>
		<cfset property(name="CustomerShipID", column="strCustomerShipID")>
		<cfset property(name="UPCCode", column="ysnUPCCode")>
		<cfset property(name="UPCCOde", column="strUPCCOde")>
		<cfset property(name="isSalesRepGroupID", column="ysnSalesRepGroupID")>
		<cfset property(name="SalesRepGroupID", column="strSalesRepGroupID")>
		<cfset property(name="isSalesRepID", column="ysnSalesRepID")>
		<cfset property(name="SalesRepID", column="strSalesRepID")>
		<cfset property(name="CommissionBatch", column="strCommissionBatch")>
		<cfset property(name="WebOrderNumber", column="strWebOrderNumber")>
		<cfset property(name="RMANumber", column="strRMANumber")>
		<cfset property(name="NoDuplicates", column="ysnNoDuplicates")>
		<cfset property(name="BillBackNumber", column="strBillBackNumber")>
		<cfset property(name="CostDistributionNumber", column="strCostDistributionNumber")>
		<cfset property(name="CCBatchNumber", column="strCCBatchNumber")>
		<cfset property(name="CCTranSequenceNumber", column="strCCTranSequenceNumber")>
		<cfset property(name="ImmedDistID", column="strImmedDistID")>
		<cfset property(name="SiteDB", column="strSiteDB")>
		<cfset property(name="SequenceID1", column="intSequenceID1")>
		<cfset property(name="IncludeSiteID", column="ysnIncludeSiteID")>
		<cfset property(name="EXBatchInID", column="strEXBatchInID")>
		<cfset property(name="EXBatchOutID", column="strEXBatchOutID")>
	
	</cffunction>
	
	<cffunction name="NextIdOrNumber" returntype="string"> 
		

		
	
		<!--- Receives WCI-1001 and returns WCI-1002--->
	</cffunction>
	

</cfcomponent>