
<cftry>
    <cfset notificationService = new "/services/NotificationService.cfc" />
    <cfset notificationService.insertNotification(
        actionID = addDaysNo.actionID,
        userid = session.userid,
        suID = NewSuid,
        notstartdate = notstartdate
    ) />
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in addNotification_5_4.cfm]: #cfcatch.message#" />
</cfcatch>
</cftry>
