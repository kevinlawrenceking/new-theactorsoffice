
<cftry>
    <cfset notificationService = new services.NotificationService()>
    <cfset notificationService.UPDnotifications_24009(userid=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_187_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating notifications." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
