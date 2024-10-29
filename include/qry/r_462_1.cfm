
<cftry>
    <cfset var notificationService = createObject("component", "services.NotificationService")>
    <cfset r = notificationService.getPendingNotifications(userID=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in r_462_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
