<!---
	This is the parent model file that all your models should extend.
	You can add functions to this file to make them globally available in all your models.
	Do not delete this file.
--->
<cfcomponent extends="Wheels">

	<cffunction name="GetStartingNumber" returntype="string" hint = "I return the next number for propertyName and then increment. Excecutes on new() "> 
	 	<cfargument name="PropertyName" required="FALSE" type="string" default ="_DEF">
		<cfargument name="increment" required="FALSE" default = "1" type="numeric">
	
		<cfset var loc = {}>
		<cfif arguments.PropertyName is "_DEF">
			<cfset loc.PropertyName = this.getPrimaryKey()>
		<cfelse>
			<cfset loc.PropertyName = arguments.PropertyName>
		</cfif>
		
		
		<cfset loc.rex="([A-Z]+)-([0-9]+)">
		
	
		<cfset SMStartingNumber = model("SMStartingNumber").findByKey(key=1,select ="NoDuplicates, #loc.PropertyName#")>
		<cfset SMStartingNumber.reload()>
		
		<cfset loc.CurNumber = structFind(SMStartingNumber,loc.PropertyName)>
		
		
		
		<cfset loc.NewNumberStruct = refind(loc.rex,loc.CurNumber,1,"TRUE")>
	
		<cfset loc.Prefix = left(loc.CurNumber, loc.NewNumberStruct.len[2])>
		
		
		<cfset loc.Number = val(right(loc.CurNumber,loc.NewNumberStruct.len[3])) + 1>
		
		
		
		<cfset loc.NumberString =loc.Prefix & "-" & numberformat(loc.Number,"#repeatString('0',loc.NewNumberStruct.len[3])#")> 
		 	
		 
		 <cfset SMStartingNumber.updateProperty(loc.PropertyName,loc.NumberString)>
		
		 <cfreturn loc.CurNumber >
	</cffunction>


</cfcomponent>