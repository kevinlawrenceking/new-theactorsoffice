
<cftry>
    <cfset timezones_min = createObject("component", "services.TimeZoneService").gettimezones()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in timezones_min_547_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
