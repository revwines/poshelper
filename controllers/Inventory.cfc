<cfcomponent hint="I controll inventory business logic" extends="Controller" output="false">


	<cffunction name="init">
		
	
	
	</cffunction>

	<cffunction name="newPhysicalInventory"> 
		
		<!--- save the new inventory record then display the items--->
	<cfset var newPhysicalInventoryDetails =[ ]  > 
		<cfset PhysicalInventory=model("physicalInventory").new(params.physicalInventory)>
		<cfset PhysicalInventory.PhysicalInventoryDetails = newPhysicalInventoryDetails>
<!--- 		<cfset PhysicalInventory()> --->
		
	
		
		<cfset inventoryItems = model("InventoryItem").findAllByWarehouseID(
				value = params.PhysicalInventory.warehouseid
				,select="ProductID, PODescription,BrandName,UnitMeasure, UnitMeasureQty,UnitsInStock,UnitsCommitted"
				,where="status='Active' AND TrackStock =1 AND itemClass='Bottled Wine'"
				,include="InventoryStockTotals")>
				
				
		
			
				<!--- Add each list item to the Physical inventory Item associton--->
				<cfloop query="InventoryItems">
					<cfset newPhysicalInventoryDetails =  model("PhysicalInventoryDetail").new(
										ProductID=InventoryItems.productid
										,UnitsInStockBooks= inventoryItems.UnitsInStock
										,PODescription = inventoryItems.PODescription
										,UnitMeasure = inventoryItems.UnitMeasure
										,UnitMeasureQty = inventoryItems.UnitMeasureQty)>
					<cfset arrayAppend(PhysicalInventory.PhysicalInventoryDetails,newPhysicalInventoryDetails)>
				</cfloop>
				
	
			
		<cfif PhysicalInventory.save()>
	<!--- 		<cfset redirectTo(action="newPhysicalInventoryDetail")> --->
				<cfset flashInsert(result="success")>
			
		<cfelse> 
		<!--- 	<cfdump var="#physicalInventory#" abort="TRUE"> --->
			<cfset warehouses = model("warehouse").findall(Select="WarehouseID,Description")>
			<cfset RenderPage(template="main")>
		</cfif>
		
		
	

	

	</cffunction>
	
	<cffunction name="newPhysicalInventoryDetail"> 
	<cfdump var="params" abort="true">

	
	</cffunction>
	
	<cffunction name="Main"> 
	
		<cfset PhysicalInventory=model("PhysicalInventory").new()>
		<cfset warehouses = model("warehouse").findall(Select="WarehouseID,Description")>
	
	</cffunction>

</cfcomponent>