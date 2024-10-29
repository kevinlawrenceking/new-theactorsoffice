
<cftry>
    <cfset notificationService = createObject("component", "services.NotificationService")>
    <cfset notificationService.updateNotificationReadStatus(notificationId=numberformat(dn))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_187_1.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
