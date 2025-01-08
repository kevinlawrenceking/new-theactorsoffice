<cfset notificationsService = createObject("component", "services.NotificationsService")>
<cfset newNotificationID = notificationService.addNotifications(
    subtitle = subtitle,
    userid = userid,
    notifUrl = "notiURL",
    notifTitle = "Maintenance System Created!",
    notifType = "System Added",
    contactid = contactid,
    isRead = 0
)>
