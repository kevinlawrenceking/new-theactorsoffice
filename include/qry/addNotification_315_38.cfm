
<cftry>
    <cfset result = createObject("component", "services.NotificationService").insertfunotifications(
        actionid = addDaysNo.actionID,
        userid = userid,
        suID = NewSuid,
        notstartdate = DateFormat(notstartdate, 'yyyy-mm-dd'),
        notstatus = 'Future'
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in addNotification_315_38.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
