
<cftry>
    <cfset variables.notificationService = createObject("component", "services.NotificationService")>
    <cfset variables.notificationService.UPDfunotifications_24032(new_notstartdate=k.new_notstartdate, notid=k.notid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in up_195_3.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
