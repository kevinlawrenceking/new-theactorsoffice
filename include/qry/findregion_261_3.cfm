
<cftry>
    <cfset regionService = new "/services/RegionService.cfc"()>
    <cfset findregion = regionService.getregions(details.valueregion)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in findregion_261_3.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
