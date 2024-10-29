
<cftry>
    <cfset reminders = 0>
    <cfset reminders = createObject("component", "/services/NotificationService").getRemindersTotal(userid)>
    <cfcatch type="any">
        <cflog type="error" text="[Error in reminders_511_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
