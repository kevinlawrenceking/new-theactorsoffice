
<cftry>
    <cfset regions = createObject("component", "services.RegionService").getregions()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in regions_518_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
