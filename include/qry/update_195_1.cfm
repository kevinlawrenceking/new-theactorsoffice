<cfset actionUserService = createObject("component", "services.ActionUserService")>
<cfset actionUserService.UPDactionusers_24030(
    actionDaysNo = actionDaysNo,
    deleteaction = deleteaction,
    actionDaysRecurring = actionDaysRecurring,
    id = id
)>