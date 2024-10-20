
<cftry>
    <cfset timeZoneService = new services.TimeZoneService()>
    <cfset timezones = timeZoneService.gettimezones()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in timezones_547_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
