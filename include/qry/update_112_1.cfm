
<cftry>
    <cfset variables.actionUserService = createObject("component", "services.ActionUserService")>
    <cfset variables.actionUserService.UPDactionusers(new_id=new_id)>

    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_112_1.cfm]: #cfcatch.message#" type="error">
        <cfthrow message="Function call failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
