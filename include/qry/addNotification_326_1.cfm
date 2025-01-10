<cfset SystemService = createObject("component", "services.SystemService")>

<!--- 
<cfset notificationService.INSfunotifications_24476(
    actionID = addDaysNo.actionID,
    userid = userid,
    NewSUID = NewSUID,
    notstartdate = notstartdate
)>
--->

<cfset new_notid = notificationService.addNotification(
    actionID = addDaysNo.actionID,
    userid = userid,
    suID = NewSuid,
    notstartdate = notstartdate,
    add_count = add_count
)>
