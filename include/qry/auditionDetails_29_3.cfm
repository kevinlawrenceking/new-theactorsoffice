
<cftry>
    <cfset auditionDetails = createObject("component", "/services/AuditionProjectService").getaudprojects(events.eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in auditionDetails_29_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
