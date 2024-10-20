
<cftry>
    <cfset cds = createObject("component", "services.AuditionProjectService").getvm_audprojects_roles_events(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in cds_31_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
