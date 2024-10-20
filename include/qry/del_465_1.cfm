
<cftry>
    <cfset result = createObject("component", "/services/NotificationService").updatefunotifications()>
    <cfset isfetch = 1>
    <!--- Code to update the database with isfetch = 1 --->
    <!--- Example: cfquery to update the database if necessary --->
<cfcatch type="any">
    <cfset errorLog = "[Error in del_465_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
