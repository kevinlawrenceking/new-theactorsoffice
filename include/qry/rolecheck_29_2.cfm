
<cftry>
    <cfset rolecheck = createObject("component", "/services/AuditionRoleService").getvm_audroles_roles_details(audroleid=audroleid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in rolecheck_29_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
