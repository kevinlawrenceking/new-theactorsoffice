
<cftry>
    <cfset actionUserService = new "/services/ActionUserService.cfc"()>
    <cfset actionUserService.updateActionUsers(
        actionDaysNo = actionDaysNo,
        deleteaction = deleteaction,
        actionDaysRecurring = actionDaysRecurring,
        id = id
    )>
    <cfquery datasource="abod">
        UPDATE database SET isfetch = 1 WHERE ...
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in update_195_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
