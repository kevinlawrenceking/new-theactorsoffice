
<cftry>
    <cfset notificationService = createObject("component", "/services/NotificationService")>
    <cfset notificationService.INSfunotifications_23941(
        new_actionid = new_actionid,
        new_userid = new_userid,
        NewSuid = NewSuid,
        notstartdate = notstartdate,
        sunotes = sunotes
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addNotification_157_10.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the notification." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
