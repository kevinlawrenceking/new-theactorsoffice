
<cftry>
    <cfset reminders = createObject("component", "/services/NotificationService").getfunotifications(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in reminders_511_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
