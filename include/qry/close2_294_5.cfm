
<cftry>
    <cfset variables.notificationService = new "/services/NotificationService.cfc"()>
    <cfset variables.notificationService.UPDfunotifications_24316(suid=suid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in close2_294_5.cfm] #cfcatch.message#">
        <cfthrow message="Error updating notification." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
