<cfcomponent extends="Model" output="false">

<cffunction name="init"> 

<cfset table("tblICItemClass")>
<cfset setPrimaryKey("itemClass")>
<cfset hasMany(Name="InventoryItems")>

<cfset property(name="ItemClass", column="strItemClass")>
<cfset property(name="Sort", column="dblSort")>
<cfset property(name="TrackStock", column="ysnTrackStock")>
<cfset property(name="TrackSerial", column="ysnTrackSerial")>
<cfset property(name="Assembly", column="ysnAssembly")>
<cfset property(name="LandedCostAccountID", column="strLandedCostAccountID")>
<cfset property(name="ShowPOS", column="ysnShowPOS")>
<cfset property(name="POSFontColorDefault", column="intPOSFontColorDefault")>
<cfset property(name="ShowProduction", column="ysnShowProduction")>
<cfset property(name="ShowInvoice", column="ysnShowInvoice")>

</cffunction>
</cfcomponent>