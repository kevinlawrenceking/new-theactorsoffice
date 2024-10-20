
<cftry>
    <cfset notificationService = new "/services/NotificationService.cfc"()>
    <cfset notificationService.updatenotifications(dn)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_187_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
