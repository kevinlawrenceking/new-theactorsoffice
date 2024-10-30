
<cftry>
    <cfset regions = createObject("component", "/services/RegionService").SELregions_24717()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in regions_518_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
