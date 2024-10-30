
<cftry>
    <cfset objNotificationService = createObject("component", "services.NotificationService")>
    <cfset objNotificationService.UPDfunotifications_24253(new_notid=x.new_notid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in rr_283_2.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the notification." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
