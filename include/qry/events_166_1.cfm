
<cftry>
    <cfset events = createObject("component", "/services/AuditionProjectService").getvm_audprojects_roles_events(mediaid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in events_166_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
