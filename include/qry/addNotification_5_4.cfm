
<cftry>
    <cfset objNotificationService = createObject("component", "services.NotificationService")>
    <cfset objNotificationService.INSfunotifications(
        actionID = addDaysNo.actionID,
        userid = session.userid,
        suID = NewSuid,
        notstartdate = notstartdate
    )>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in addNotification_5_4.cfm]: #cfcatch.message#">
    <cfthrow>
</cfcatch>
</cftry>
