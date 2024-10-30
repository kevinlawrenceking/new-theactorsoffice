
<cftry>
    <cfset findregion = createObject("component", "/services/RegionService").SELregions(region_id=region_id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findregion_199_5.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving the region name." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
