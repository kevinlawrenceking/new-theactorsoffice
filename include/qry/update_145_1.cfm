
<cftry>
    <cfset actionUserService = createObject("component", "services.ActionUserService")>
    <cfset actionUserService.updateActionUser(new_id=new_id)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in update_145_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
