<cfcomponent extends="Model" output="false">

<cffunction name="init"> 
	
	<cfset table("tblICWarehouse")>
	<cfset setPrimaryKey("warehouseid")>
	<cfset hasMany("PhysicalInventories")>
	<cfset hasMany("InventoryStockTotals")>

	<cfset property(name="WarehouseID", column="strWarehouseID")>
	<cfset property(name="Description", column="strDescription")>
	<cfset property(name="WarehouseType", column="strWarehouseType")>
	<cfset property(name="ContactName", column="strContactName")>
	<cfset property(name="Address", column="strAddress")>
	<cfset property(name="County", column="strCounty")>
	<cfset property(name="City", column="strCity")>
	<cfset property(name="State", column="strState")>
	<cfset property(name="Zip", column="strZip")>
	<cfset property(name="Country", column="strCountry")>
	<cfset property(name="Phone", column="strPhone")>
	<cfset property(name="Fax", column="strFax")>
	<cfset property(name="Email", column="strEmail")>
	<cfset property(name="WebSite", column="memWebSite")>
	<cfset property(name="ShipVia", column="strShipVia")>
	<cfset property(name="Manager", column="strManager")>
	<cfset property(name="OtherContacts", column="strOtherContacts")>
	<cfset property(name="ContactInfo", column="strContactInfo")>
	<cfset property(name="Directions", column="strDirections")>
	<cfset property(name="Notes", column="strNotes")>
	<cfset property(name="Office", column="strOffice")>
	<cfset property(name="Department", column="strDepartment")>
	<cfset property(name="Assistant", column="strAssistant")>
	<cfset property(name="Category", column="strCategory")>
	<cfset property(name="Attention", column="strAttention")>
	<cfset property(name="Title", column="strTitle")>
	<cfset property(name="OtherNames", column="strOtherNames")>
	<cfset property(name="DateEntered", column="dtmDateEntered")>
	<cfset property(name="DateLastModified", column="dtmLastModified")>
	<cfset property(name="SalesAccountID", column="strSalesAccountID")>
	<cfset property(name="InventoryAccountID", column="strInventoryAccountID")>
	<cfset property(name="COGSAccountID", column="strCOGSAccountID")>
	<cfset property(name="LandedCostAccountID", column="strLandedCostAccountID")>
	<cfset property(name="TaxType", column="strTaxType")>
	<cfset property(name="FedTaxSales", column="ysnFedTaxSales")>
	<cfset property(name="FedTaxSalesLiable", column="ysnFedTaxSalesLiable")>
	<cfset property(name="FedTaxTransfers", column="ysnFedTaxTransfers")>
	<cfset property(name="FedTaxTransfersLiable", column="ysnFedTaxTransfersLiable")>
	<cfset property(name="Active", column="ysnActive")>
	<cfset property(name="BondDesc", column="strBondDesc")>
	<cfset property(name="Premise", column="strPremise")>
	<cfset property(name="SupplyWarehouse", column="strSupplyWarehouse")>
	<cfset property(name="GLBulkAccount", column="strGLBulkAccount")>
	<cfset property(name="FGWineryWarehouse", column="strFGWineryWarehouse")>
	<cfset property(name="BondCode", column="strBondCode")>
	<cfset property(name="LotFormat", column="strLotFormat")>
	
</cffunction>
</cfcomponent>