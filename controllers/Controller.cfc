<!---
	This is the parent controller file that all your controllers should extend.
	You can add functions to this file to make them globally available in all your controllers.
	Do not delete this file.
--->
<cfcomponent extends="Wheels">
	
	<cffunction name="init">
		
<!--- 		<cfset filters(through="checkLogin", except="login")> --->
	
	</cffunction>
	
	
		<cffunction
		name="ISOToDateTime"
		access="public"
		returntype="string"
		output="false"
		hint="Converts an ISO 8601 date stamp with optional dashes to a ColdFusion date/time stamp.">
		 
		<!--- Define arguments. --->
		<cfargument
		name="Date"
		type="string"
		required="true"
		hint="ISO 8601 date/time stamp."
		/>
		 
		<!---
		When returning the converted date/time stamp,
		allow for optional dashes.
		--->
		<cfreturn ARGUMENTS.Date.ReplaceFirst(
		"^.*?(\d{4})-?(\d{2})-?(\d{2})",
		"$1-$2-$3"
		) />
		</cffunction>
</cfcomponent>