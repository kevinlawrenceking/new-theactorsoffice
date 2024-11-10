<cfset notificationService = createObject("component", "services.NotificationService")>
<cfset notificationService.INSfunotifications_24476(
    actionID = addDaysNo.actionID,
    userid = userid,
    NewSUID = NewSUID,
    notstartdate = notstartdate
)>