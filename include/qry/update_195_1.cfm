
<cftry>
    <cfset actionUserService = new "/services/ActionUserService.cfc"()>
    <cfset result = actionUserService.updateactionusers({
        actionDaysNo: actionDaysNo,
        deleteaction: deleteaction,
        actionDaysRecurring: actionDaysRecurring,
        id: id
    })>
<cfcatch type="any">
    <cfset errorLog = "[Error in update_195_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
