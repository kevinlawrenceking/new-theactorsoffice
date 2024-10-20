
<cftry>
    <cfset componentPath = "/services/AuditionRoleService.cfc">
    <cfset auditionRoleService = createObject("component", componentPath)>
    <cfset auditionRoleService.updateaudroles()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in submitsitefix_368_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
