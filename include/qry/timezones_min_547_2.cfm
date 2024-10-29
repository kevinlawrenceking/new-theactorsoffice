
<cftry>
    <cfset timeZoneService = createObject("component", "services.TimeZoneService")>
    <cfset timezones_min = timeZoneService.getTimezones()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in timezones_min_547_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
