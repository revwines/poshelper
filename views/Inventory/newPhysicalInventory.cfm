
<cfparam name="PhysicalInventory">


<cfoutput> 

	
#startformtag(action="savePhysicalInventory")#
<fieldset class="fs-level-1">
	<legend class="fs-legend-level-1">Physical Inventory Header</legend>
	<table> 
		<tr>
	<!--- 
	#textDisplay(ObjectName="PhysicalInventory",property="InventoryApprovedBy",prependTolabel="<Td>", prepend="<td>",append="</td>",ReplaceMissingValueWith="-None-")#
		#textDisplay(ObjectName="PhysicalInventory", property="InventoryTakenBY",prependTolabel="<Td>", prepend="<td>",append="</td>",ReplaceMissingValueWith="-None-" )#
 --->
		</tr>
	
	</table>
	#hiddenfield(objectName="PhysicalInventory", property="id")#
	<div class="form-display-only">
	<span class="form-label">warehouse ID:</span><span class="form-data">#PhysicalInventory.warehouseID#</span>
	</div>
	#textField(objectName="PhysicalInventory",property="PhysicalInventoryDate",  labelPlacement="around")#
</fieldset>
	
<table class="tab-decorated">
	<thead>   
		<tr> 
			<th>Item</th>
			<th>On hand</th>
			<th title="Unit of<BR>Measure">UOM</th>
			<th>UOM<BR>Quantity</th>
			<th title="Actual Inventory-UOM">UOM<BR>In Stock</th>
			<th title="Actual Inventory-EA">EA<BR>In Stock</th>
			<th title="Actual Inventory">Units<BR>In Stock</th>
		</tr>
	</thead>
	<tbody> 
	
		#includePartial(PhysicalInventory.PhysicalInventoryDetails)#
	
	</tbody>

</table>

</cfoutput>