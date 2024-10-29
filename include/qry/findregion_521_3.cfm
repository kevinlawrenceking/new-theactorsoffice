
<cftry>
    <cfset findregion = createObject("component", "services.RegionService").getRegionIdByRegionName(details.valueregion)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findregion_521_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
