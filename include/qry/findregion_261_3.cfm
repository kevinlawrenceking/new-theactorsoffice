
<cftry>
    <cfset regionService = createObject("component", "services.RegionService")>
    <cfset findregion = regionService.getRegionIdByRegionName(valueregion=details.valueregion)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findregion_261_3.cfm]: #cfcatch.message#">
        <cfset findregion = queryNew("region_id")>
    </cfcatch>
</cftry>
