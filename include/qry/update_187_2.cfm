
<cftry>
    <cfset notificationService = new services.NotificationService()>
    <cfset notificationService.updatenotifications(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_187_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
