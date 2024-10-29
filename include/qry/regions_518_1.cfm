
<cftry>
    <cfset regions = createObject("component", "/services/RegionService").getRegions()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in regions_518_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
