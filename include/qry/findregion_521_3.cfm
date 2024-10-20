
<cftry>
    <cfset regionService = new "/services/RegionService.cfc"()>
    <cfset findregion = regionService.getregions(details.valueregion)>
<cfcatch type="any">
    <cfset errorLog = "[Error in findregion_521_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
