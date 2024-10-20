
<cftry>
    <cfset rolecheck = createObject("component", "/services/AuditionRoleService").getvm_audroles_roles_details(audroleid=audroleid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in rolecheck_90_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
