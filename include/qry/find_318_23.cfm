
<cftry>
    <cfset actionUserService = createObject("component", "services.ActionUserService")>
    <cfset find = actionUserService.getActionUsers(actionid=xs.actionid, userid=users.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_23.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
