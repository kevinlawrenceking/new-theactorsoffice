
<cftry>
    <cfset variables.notificationService = createObject("component", "/services/NotificationService")>
    <cfset variables.notificationService.updateNotificationStatus(new_notid=new_notid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_551_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
