<cfset notificationService = createObject("component", "services.NotificationService")>
<cfset notsActive = notificationService.SELfunotifications_24706(
    currentid = currentid,
    sysActiveSuid = sysActive.suid,
    sessionUserid = userid,
    hideCompleted = hide_completed
)>