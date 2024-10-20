
<cftry>
    <cfset result = createObject("component", "/services/NotificationService").insertfunotifications(
        actionid = new_actionid,
        userid = new_userid,
        suID = NewSuid,
        notstartdate = notstartdate,
        notstatus = "Pending",
        notnotes = sunotes
    )>
    <cfquery>
        UPDATE databaseTable SET isfetch = 1 WHERE id = someId
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in addNotification_157_10.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
