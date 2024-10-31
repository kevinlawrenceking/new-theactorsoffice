
<cftry>
    <cfset notificationService = createObject("component", "services.NotificationService")>
    <cfset notificationService.INSfunotifications_23940(
        new_actionid = new_actionid,
        new_userid = new_userid,
        NewSuid = NewSuid,
        notstartdate = notstartdate,
        sunotes = sunotes
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addNotification_157_9.cfm]: #cfcatch.message#">
        <cfthrow message="Error inserting notification." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
