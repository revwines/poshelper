$(document).ready(function(){

	$(function() {
		// setup ul.tabs to work as tabs for each div directly under div.panes
		$("#NavTabs").tabs();
	});

	/*** inventory views ***/
	$("#newPhysicalInventoryDialog").dialog({
			autoOpen:false,
			height: 400,
			width: 550,
			modal: true,
			title:'Start Physical Inventory',
			buttons: {
				Cancel:function (){
					$( this ).dialog( "close" );
				},
				Submit: function(){
					
					$("#newPhysicalInventoryForm").submit();
					
				}

			}
				
	}
	);
	
	
	$("#newPhysicalInventoryLink").click(
			function(){
				$( "#newPhysicalInventoryDialog" ).dialog( "open" );
				});
	
	// http://codylindley.com/jqueryselectors/
	//http://www.bobthegeek.com/?p=45
    //we want to highlight the row only if the item focused on is a textbox,
    //password or select list. Buttons should be ignored...
    $(":input").not(":button")
        .focus(function () {
            //highlight the containing table row...
            $(this).parents("tr").css({ 'background': '#14BDF4' });
        })
        .blur(function () {
            //remove the background attribute from the inline style...
            $(this).parents("tr").css({ 'background': '' });
        });

	$(".TD-UOM").blur(function (){
	
		unitsInStock(this);
		//alert(TheEA);
	});
	
	$(".TD-EA").blur(function(){	
		unitsInStock(this);
	})
	
	function thisRowVal (elementTD){
		//var selectedRow=$(elementTD).parents('tr')
		return   $(elementTD).parents('tr').attr("id");
		
		
	}
	function totalUnits(UOM,UMQ, Ea){
		 return (UOM*UMQ)+ Ea;
		
	}
	function unitsInStock(elementTD){
		//var selectedRow=$(inputElement).parents('tr');
		
		var curID = $(elementTD).parents('tr').attr("id");
		var EAval = "#EA-" + curID;
		var UOMval = "#UOM-" + curID;
		var UMQval = "#UMQ-" + curID;
		var UOHval = "#UOH-" + curID
		var UOM = $(elementTD).parents('tr').find(UOMval).val();
		var UMQ = $(elementTD).parents('tr').find(UMQval).val();
		var EA = $(elementTD).parents('tr').find(EAval).val(); //value of EACH	
		//var unitsInStock=totalUnits(theUOM,theUMQ,theEA)
		//alert("UOM:" + UOM + " UMQ: " + UMQ + " EA: " + EA);
		var units = (UOM*UMQ)+ parseFloat(EA);
		if (isNaN(units)) {
			$(elementTD).parents('tr').find(UOHval).val(0);
		}	
		else {
			if (typeof(units)=="number") {
				 $(elementTD).parents('tr').find(UOHval).val(units);
			} 
			else {
				
				$(elementTD).parents('tr').find(UOHval).val(0);
			}	
			
		}

			
	}
	
	
});