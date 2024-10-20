
<cftry>
    <cfset notificationService = new services.NotificationService()>
    <cfset notificationService.updatefunotifications(
        notStatus = 'Completed',
        notenddate = notendDate,
        notid = notid
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in addNotification_71_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
