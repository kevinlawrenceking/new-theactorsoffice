
<!--- This ColdFusion page retrieves meeting durations from the database. --->
<cftry>
    <cfset durations = createObject("component", "services.MeetingDurationService").getmtgdurations()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in durations_468_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
