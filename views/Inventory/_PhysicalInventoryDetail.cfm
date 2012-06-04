
<cfoutput>
	<tr id="#arguments.current#">
	<td>#arguments.PODescription#</td>
	<td>#arguments.UnitsInStockBooks#</td>
	<td>#arguments.UnitMeasure#</td>
	<td>#arguments.UnitMeasureQty#
	#hiddenField(ObjectName="PhysicalInventory",property="UnitMeasureQty", association="physicalInventoryDetails",position=arguments.current,class="TD-UMQ", id="UMQ-#arguments.current#")#</td>
	<td>#textfield(ObjectName="PhysicalInventory",label="",id="UOM-#arguments.current#",class="TD-UOM", appendToLabel="",association="physicalInventoryDetails",position=arguments.current, property="UnitsInStockUOM")#</td>
	<td>#textfield(ObjectName="PhysicalInventory",label="",id="EA-#arguments.current#", class="TD-EA",appendToLabel="",association="physicalInventoryDetails",position=arguments.current, property="UnitsInStockEa")#</td>
	<td>#textField(ObjectName="PhysicalInventory",label="",id="UOH-#arguments.current#",class="TD-UNITS" ,appendToLabel="",association="physicalInventoryDetails",position=arguments.current, property="UnitsInStockActual")#</td>
	</tr>
</cfoutput>