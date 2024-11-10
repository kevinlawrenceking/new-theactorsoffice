<cfset notificationService = createObject("component", "services.NotificationService")>
<cfset r = notificationService.SELfunotifications_24638(userID=userid)>
<cflog file="errorLog" text="[Error in r_462_1.cfm]: Error handling removed">