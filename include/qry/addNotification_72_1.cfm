
<cftry>
    <cfset variables.notificationService = createObject("component", "/services/NotificationService")>
    <cfset variables.notificationService.updatefunotifications(notid, notendDate)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in addNotification_72_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
