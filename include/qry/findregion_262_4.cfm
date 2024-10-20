
<cftry>
    <cfset regionService = new "/services/RegionService.cfc"()>
    <cfset findregion = regionService.getregions(region_id, old_countryid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findregion_262_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
