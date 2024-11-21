
<cfset ActionUserService = createObject("component", "services.ActionUserService")>
<cfset ActionUserService.UPDactionusers_24030(
    id = id,
    actionDaysNo = actionDaysNo,
    deleteAction = deleteaction,
    actionDaysRecurring = "actionDaysRecurring"
)>