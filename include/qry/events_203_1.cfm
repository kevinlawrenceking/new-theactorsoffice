
<cftry>
    <cfset events = createObject("component", "services.AuditionProjectService").getvm_audprojects_roles_events(audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in events_203_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
