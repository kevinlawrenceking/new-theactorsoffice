<cfset notificationStatusService = createObject("component", "services.NotificationStatusService")>
<cfset blue = notificationStatusService.SELnotstatuses(
    currentid = currentid,
    sysActiveSuid = sysActive.suid,
    userid = userid
)>

