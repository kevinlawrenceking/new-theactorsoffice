
<cftry>
    <cfset findregion = createObject("component", "services.RegionService").getRegionName(region_id=region_id, old_countryid=old_countryid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findregion_262_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
