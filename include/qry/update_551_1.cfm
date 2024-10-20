
<cftry>
    <cfset notificationService = new services.NotificationService()>
    <cfset notificationService.updatefunotifications(new_notid)>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_551_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
