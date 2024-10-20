
<cftry>
    <cfset result = createObject("component", "/services/NotificationService").insertfunotifications(
        actionid = addDaysNo.actionID,
        userid = userid,
        suID = NewSuid,
        notstartdate = DateFormat(notstartdate, 'yyyy-mm-dd')
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in addNotification_315_37.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
