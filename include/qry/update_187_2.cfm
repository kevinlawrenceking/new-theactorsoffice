
<cftry>
    <cfset notificationService = createObject("component", "services.NotificationService")>
    <cfset notificationService.updateNotifications(userid=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_187_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating notifications." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
