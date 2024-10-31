
<cftry>
    <cfset actionUserService = createObject("component", "services.ActionUserService")>
    <cfset actionUserService.UPDactionusers_24030(
        actionDaysNo = actionDaysNo,
        deleteaction = deleteaction,
        actionDaysRecurring = actionDaysRecurring,
        id = id
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_195_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error executing update_195_1.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>

