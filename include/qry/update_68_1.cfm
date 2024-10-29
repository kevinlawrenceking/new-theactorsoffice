
<cftry>
    <cfset componentPath = "/services/AuditionRoleService.cfc">
    <cfset auditionRoleService = createObject("component", componentPath)>
    <cfset auditionRoleService.updateAudRolesStatus(statusField="#statusfield#", newAudRoleId="#new_audroleid#")>

    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_68_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error in update_68_1.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
