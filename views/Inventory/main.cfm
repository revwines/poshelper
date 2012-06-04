<cfparam name="PhysicalInventory">
<cfparam name="warehouses">

<script> 
$(document).ready(function (){
	//alert($("#newPhysicalInventoryErrorCount").val());
	
	if ($("#newPhysicalInventoryErrorCount").val() >0) {
		$( "#newPhysicalInventoryDialog" ).dialog( "open" );
	}
 })
</script>


<div>
	<ul>
		<li><span id="newPhysicalInventoryLink" class="vlink">Create New Physical Inventory</span></li>
		<li>Request Wine from Cellar</li>
	</ul>

</div>

<cfoutput>
<div id="newPhysicalInventoryDialog"> 
	#ErrorMessagesFor(objectName="PhysicalInventory")#
	#hiddenFieldTag(name="Test", id="newPhysicalInventoryErrorCount", value=PhysicalInventory.errorcount())#
	#startFormTag(id="newPhysicalInventoryForm",controller="inventory",action="newPhysicalInventory")#
	#textField(ObjectName="PhysicalInventory",property="InventoryTakenBy")#
	#textField(ObjectName="PhysicalInventory",property="PhysicalInventoryDate")#
	#select(ObjectName="PhysicalInventory",property="Warehouseid", options=warehouses, valueField="warehouseid",textField="Description")#
	#endFormTag()#
</div>

</cfoutput>
