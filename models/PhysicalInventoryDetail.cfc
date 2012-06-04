<cfcomponent extends="Model" output="false">

	<cffunction name="init"> 
	
	<cfset table("tblICPhysicalInventoryDetail")>
<!--- 	<cfset setPrimaryKey("ProductId,WarehouseID,PhysicalInventoryDate")> --->
	<cfset BelongsTo("InventoryStockTotal")>
	<cfset belongsTo("PhysicalInventory")>
	<cfset belongsTo("InventoryItem")>
	
	
	<cfset property(name="ProductID", column="strProductID")>
	<cfset property(name="PhysicalInventoryId", column="intPhysicalInventoryID")>
	<cfset property(name="UnitsInStockActual", column="dblUnitsInStockActual")>
	<cfset property(name="UnitsInStockBooks", column="dblUnitsInStockBooks")>
	<cfset property(name="UnitsCommittedBooks", column="dblUnitsCommittedBooks")>
	<cfset property(name="UnitsAllocated", column="dblUnitsAllocated")>
	<cfset property(name="UnitsInStockUOM", column="dblUnitsInStockUOM", label="Units In Stock (by UOM)")>
	<cfset property(name="UnitsInStockEA", column="dblUnitsInStockEA", label="Units In Stock (ea)")>

	</cffunction>
</cfcomponent>