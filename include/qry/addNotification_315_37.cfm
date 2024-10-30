
<cftry>
    <cfset variables.notificationService = createObject("component", "/services/NotificationService")>
    <cfset variables.notificationService.INSfunotifications_24430(
        actionID = addDaysNo.actionID,
        userid = userid,
        NewSuid = NewSuid,
        notstartdate = notstartdate
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addNotification_315_37.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
