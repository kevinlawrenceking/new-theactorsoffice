
<cftry>
    <cfset componentPath = "/services/AuditionRoleService.cfc">
    <cfset auditionRoleService = createObject("component", componentPath)>
    <cfset del3 = auditionRoleService.updateaudroles(audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del3_232_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
