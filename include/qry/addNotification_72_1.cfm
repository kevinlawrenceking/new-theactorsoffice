
<cftry>
    <cfset notificationService = new services.NotificationService()>
    <cfset notificationService.updateNotificationStatus(notid=notid, notendDate=notendDate)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addNotification_72_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error in addNotification_72_1.cfm" detail="#cfcatch.Detail#">
    </cfcatch>
</cftry>
