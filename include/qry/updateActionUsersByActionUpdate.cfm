<cfparam name="deleteAction"
<cfset ActionUserService = createObject("component", "services.ActionUserService")>
<cfset ActionUserService.updateActionUsers(
    id = id,
    actionDaysNo = actionDaysNo,
    isDeleted = deleteaction,
    actionDaysRecurring = actionDaysRecurring
)>