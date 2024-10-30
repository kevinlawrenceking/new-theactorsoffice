
<cftry>
    <cfset cities = createObject("component", "/services/CityService").SELcities()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in cities_448_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
