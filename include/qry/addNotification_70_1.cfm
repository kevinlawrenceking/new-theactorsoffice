
<cftry>
    <cfset notificationService = createObject("component", "services.NotificationService")>
    <cfset notificationService.UPDfunotifications_23831(
        notStatus = notStatus,
        notEndDate = notEndDate,
        notId = notid
    )>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in addNotification_70_1.cfm]: #cfcatch.message#">
    <cfthrow message="An error occurred while updating the notification status." detail="#cfcatch.detail#">
</cfcatch>
</cftry>
