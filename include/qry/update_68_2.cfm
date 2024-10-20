
<cftry>
    <cfset componentPath = "/services/AuditionRoleService.cfc">
    <cfset auditionRoleService = createObject("component", componentPath)>
    <cfset result = auditionRoleService.updateaudroles(new_audroleid, statusfield)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_68_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
