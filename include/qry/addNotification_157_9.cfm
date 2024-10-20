
<cftry>
    <cfset result = createObject("component", "/services/NotificationService").insertfunotifications(
        actionid = new_actionid,
        userid = new_userid,
        suID = NewSuid,
        notstartdate = notstartdate,
        notnotes = sunotes
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming there's a function or query to update the database here --->
<cfcatch type="any">
    <cfset errorLog = "[Error in addNotification_157_9.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
