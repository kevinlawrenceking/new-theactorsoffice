
<cftry>
    <cfset result = createObject("component", "/services/NotificationService").insertfunotifications(
        actionid = addDaysNo.actionID,
        userid = userid,
        suID = NewSUID,
        notstartdate = DateFormat(notstartdate, 'yyyy-mm-dd'),
        notstatus = 'Pending'
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in addNotification_326_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
