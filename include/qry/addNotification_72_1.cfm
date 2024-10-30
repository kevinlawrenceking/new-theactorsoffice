
<cftry>
    <cfset notificationService = new services.NotificationService()>
    <cfset notificationService.UPDfunotifications_23823(notid=notid, notendDate=notendDate)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addNotification_72_1.cfm] #cfcatch.message#">
        <cfthrow message="Error updating notification status." detail="#cfcatch.Detail#">
    </cfcatch>
</cftry>
