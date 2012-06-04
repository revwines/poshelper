<cfcomponent extends="Model" output="false">

	<cffunction name="init"> 
		
		<!---Configuration--->
		<cfset table("tblICPhysicalInventory")>
		
		<!--- associations---->
		<cfset hasMany(name="PhysicalInventoryDetails", shortCut="InventoryItem")>
		<cfset belongsTo(name="warehouse")>
		
		<!--- ORM Mappings---->
		<cfset property(name="ID", column="cntID")>
		<cfset property(name="WarehouseID", column="strWarehouseID", label="Warehouse:")>
		<cfset property(name="PhysicalInventoryDate", column="dtmPhysicalInventoryDate", label="Inventory Date")>
		<cfset property(name="InventoryApprovedBy", column="strInventoryApprovedBy")>
		<cfset property(name="InventoryTakenBy", column="strInventoryTakenBy", label="Inventory Taken By")>
		<cfset property(name="createdat", column="dtmCreated")>
		<cfset property(name="updatedat", column="dtmUpdated")>
		<cfset property(name="deletedat", column="dtmDeleted")>
		
<cfset property(name="WarehouseDescription"
					,SQL = "select strDescription from tblICWarehouse where tblICWarehouse.strWarehouseID = strWarehouseID") > 
		
		<cfset nestedProperties(asssociation="PhysicalInventoryDetails")>
		<!---Validations--->
		
		
		<cfset validatesPresenceOf("InventoryTakenBy, PhysicalInventoryDate,WarehouseID")>
	</cffunction>
</cfcomponent>