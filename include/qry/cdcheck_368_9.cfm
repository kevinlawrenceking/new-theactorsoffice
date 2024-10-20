
<cftry>
    <cfset cdcheck = createObject("component", "/services/AuditionProjectService").getvm_audprojects_roles_events(audprojectID)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in cdcheck_368_9.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
