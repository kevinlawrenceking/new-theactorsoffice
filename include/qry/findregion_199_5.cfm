
<cftry>
    <cfset findregion = createObject("component", "services.RegionService").getregions(region_id)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findregion_199_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
