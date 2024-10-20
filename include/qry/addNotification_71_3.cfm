
<cftry>
    <cfset result = createObject("component", "services.NotificationService").insertfunotifications(
        actionid=notsdetails.actionID,
        userid=userid,
        suID=NewSuid,
        notstartdate=DateFormat(newest_notstartdate, 'yyyy-mm-dd'),
        notstatus='Pending'
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in addNotification_71_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
