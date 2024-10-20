
<cftry>
    <cfset coss = createObject("component", "services.AuditionProjectService").getvm_audprojects_roles_events(userid=userid, sel_coname=sel_coname)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in coss_371_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
