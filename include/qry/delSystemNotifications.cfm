<cfset notificationService = createObject("component", "services.NotificationService")>

<cfset notifications = notificationService.fetchNotifications(
    userID = userid
) />
