
<cftry>
    <cfset aud_det = createObject("component", "/services/AuditionProjectService").getvm_audprojects_roles_events(eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in aud_det_221_9.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
