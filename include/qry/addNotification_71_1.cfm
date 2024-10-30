
<cftry>
    <cfset notificationService = new services.NotificationService()>
    <cfset notificationService.UPDfunotifications(notid=notid, notendDate=notendDate)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in addNotification_71_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the notification status." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
