
<cftry>
    <cfset objNotificationService = createObject("component", "/services/NotificationService")>
    <cfset objNotificationService.updateNotificationStartDate(new_notstartdate=k.new_notstartdate, notid=k.notid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in up_195_3.cfm]: #cfcatch.message#" type="error">
        <cfthrow message="Function call failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
