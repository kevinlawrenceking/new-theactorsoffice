
<cftry>
    <cfset result = createObject("component", "/services/NotificationService").insertfunotifications(
        actionid = addDaysNo.actionID,
        userid = session.userid,
        suID = NewSuid,
        notstartdate = DateFormat(notstartdate, 'yyyy-mm-dd'),
        notstatus = 'Pending'
    )>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming you have a method or query to update the database --->
    <!--- Example: updateDatabaseIsFetch(1) --->
<cfcatch type="any">
    <cfset errorLog("[Error in addNotification_5_4.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
