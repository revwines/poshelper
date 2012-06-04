<cfcomponent extends="Model" output="false">

<cffunction name="init"> 

	<cfset table("tblICInventoryStockTotal")>
	<!--- <cfset setPrimaryKey("ProductID,WarehouseID")> --->
	
	<cfset belongsTo(name="InventoryItem",foreignKey="ProductID")>
	<cfset belongsTo("Warehouse")>

	
	<cfset property(name="ProductID", column="strProductID")>
	<cfset property(name="WarehouseID", column="strWarehouseID")>
	<cfset property(name="UnitsInStock", column="dblUnitsInStock")>
	<cfset property(name="UnitsCommitted", column="dblUnitsCommitted")>
	<cfset property(name="UnitsOnBackOrder", column="dblUnitsOnBackOrder")>
	<cfset property(name="UnitsOnOrder", column="dblUnitsOnOrder")>
	<cfset property(name="ReorderPoint", column="dblReorderPoint")>
	<cfset property(name="UnitsAllocated", column="dblUnitsAllocated")>
	<cfset property(name="SalesAccountID", column="strSalesAccountID")>
	<cfset property(name="InventoryAccountID", column="strInventoryAccountID")>
	<cfset property(name="COGSAccountID", column="strCOGSAccountID")>
	<cfset property(name="LandedCostAccountID", column="strLandedCostAccountID")>
	<cfset property(name="LocationRow", column="strLocationRow")>
	<cfset property(name="LocationBin", column="strLocationBin")>
	<cfset property(name="Location", column="strLocation")>
	<cfset property(name="Show", column="ysnShow")>
	<cfset property(name="WarehouseCost", column="curWarehouseCost")>
	<cfset property(name="DistributedCost", column="curDistributedCost")>
	<cfset property(name="ManufBatch", column="strManufBatch")>
	<cfset property(name="RowVersion", column="tsRowVersion")>

</cffunction>
</cfcomponent>