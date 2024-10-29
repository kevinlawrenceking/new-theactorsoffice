
<cftry>
    <cfset actionUserService = createObject("component", "/services/ActionUserService")>
    <cfset actionUserService.updateActionUser(new_id=new_id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_112_1.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
