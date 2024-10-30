
<cftry>
    <cfset timezoneService = createObject("component", "/services/TimeZoneService")>
    <cfset timezones = timezoneService.SELtimezones()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in timezones_547_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
