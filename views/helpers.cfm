<!--- Place helper functions here that should be available for use in all view pages of your application --->

<cffunction name="textDisplay" returntype="string" hint="I'm used to markup object properties for display"> 
	<cfargument name="objectName" type="string" required="TRUE"> 
	<cfargument name="property" type="string" required ="TRUE">
	<cfargument name="prependToLabel" type="string" required="False" default =""> 
	<cfargument name="appendToLabel" type="string" required="false" default =""> 
	<cfargument name="append" type="string" required="false" default =""> 
	<cfargument name="prepend" type="string" required="false" default=""> 
	<cfargument name="label" type="string" required="false" default="">	
	<cfargument name="labelPlacement" type="string" required="false" default="BEFORE">
	<cfargument name="id" type="string" required="false" default="">
	<cfargument name="class" type="string" required="false" default ="">
	<cfargument name="association" type="string" hint="association used for decoding a FK Value">
	<cfargument name="ReplaceMissingValueWith" stype="string" required="false">
	
	
<!--- this helper marks up object properties for display (as opposed to input)" 

Since there are no specific tags in the hmtml spec, this function will use the span tag to 
identify a 'label' --->

<cfset displayObject=evaluate(objectName)>



<!--- Label---->
<cfif len(arguments.label) ge 1>
	<cfset displayLabel=arguments.label>
<cfelse>
	
	<cfset displayLabel = displayObject.$PROPERTYINFO(property).LABEL>

</cfif>
<!--- <cfoutput>#displayLabel#</cfoutput>
<cfabort> --->

<cfif len(displayLabel) eq 0> 
	<cfset displayLabel=displayObject.humanize(property)>
</cfif>

<!--- value property---->
<cfif structKeyExists(displayObject,property)> 
	<cfset DisplayValue= evaluate("#objectName#.#property#")>
<cfelse>
	<cfset DisplayValue=arguments.ReplaceMissingValueWith>
</cfif> 
	
<cfset ValueBetween="">
<cfset valueDisplayMarkUp ='#prepend#<span id="value-#ObjectName#-#property#" class="property-display-value">#displayValue#</span>#append#' >
<cfset labelDisplayMarkUp = '#prependToLabel#<span id="display-#ObjectName#-#property#" class="property-display-label">#displayLabel##ValueBetween#</span>#appendToLabel#'>

<cfswitch expression="labelPlacement">  

	<cfcase value="AROUND"> 
		<cfset ValueBetween=valueDisplayMarkUp>
		<cfset displayMarkup =labelDisplayMarkUp>
	</cfcase>
	<cfcase value="AFTER"> 
		<cfset displayMarkup=valueDisplayMarkup & labelDisplayMarkUp>
	</cfcase>
	<cfdefaultcase>
		<cfset displayMarkup=labelDisplayMarkUp & valueDisplayMarkup>
	</cfdefaultcase>
</cfswitch>

<cfreturn displaymarkup>



</cffunction>

<cffunction name="ObjectDisplay"> 
	<cfargument name="layout" default="table"> <!--- takes "Table" and juiBox.  juiBox is a jquery UI div box model---->
	<cfargument name="properties"> 
	<cfargument name="NumberOfColumns">
	
	<cfset append="</TD>">
	<cfset prepend="<TD>">
	<cfset appendToLabel="</TD>">
	<cfset preendToLabel="<TD>">
	
	


</cffunction>