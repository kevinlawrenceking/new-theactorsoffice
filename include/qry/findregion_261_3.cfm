
<cftry>
    <cfset findregion = createObject("component", "services.RegionService").SELregions_24170(valueregion=details.valueregion)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findregion_261_3.cfm]: #cfcatch.message#">
        <cfset findregion = queryNew("region_id")>
    </cfcatch>
</cftry>
