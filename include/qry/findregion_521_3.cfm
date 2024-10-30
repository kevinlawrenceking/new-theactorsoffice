
<cftry>
    <cfset findregion = createObject("component", "services.RegionService").SELregions_24721(regionName=details.valueregion)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findregion_521_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
