
<cftry>
    <cfset notificationService = new "/services/NotificationService.cfc"()>
    <cfset notificationService.updatefunotifications(
        notStatus = notStatus,
        notEndDate = (notStatus eq "Completed" or notStatus eq "Skipped") ? notEndDate : "",
        notId = notId
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in addNotification_70_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
