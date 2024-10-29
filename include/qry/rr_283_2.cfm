
<cftry>
    <cfset variables.notificationService = createObject("component", "/services/NotificationService")>
    <cfset variables.notificationService.updateNotification(new_notid = x.new_notid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in rr_283_2.cfm] Error updating notification: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the notification." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
