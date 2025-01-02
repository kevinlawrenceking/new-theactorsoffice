<cfparam name="deleteaction" default="0" /> 
<cfset ActionUserService = createObject("component", "services.ActionUserService")>
<cfset ActionUserService.updateActionUsers(
    id = id,
    actionDaysNo = actionDaysNo,
    isDeleted = deleteaction,
    actionDaysRecurring = actionDaysRecurring,
    systemid = target_id_system
)>