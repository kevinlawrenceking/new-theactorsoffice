
<cftry>
    <cfset timeZoneService = createObject("component", "services.TimeZoneService")>
    <cfset timezones = timeZoneService.getTimezones()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in timezones_547_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
