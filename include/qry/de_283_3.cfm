
<cftry>
    <cfset actionUserService = createObject("component", "services.ActionUserService")>
    <cfset actionUserService.UPDactionusers_24254(userid=userid, target_id_system=target_id_system)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in de_283_3.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
