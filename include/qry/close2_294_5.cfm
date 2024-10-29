
<cftry>
    <cfset notificationService = new "/services/NotificationService.cfc"()>
    <cfset notificationService.updateNotificationIsDeleted(suid=#suid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in close2_294_5.cfm] Error updating notification: #cfcatch.message#">
        <cfthrow message="Error updating notification." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
