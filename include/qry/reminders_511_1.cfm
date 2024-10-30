
<cftry>
    <cfset reminders = 0>
    <cfset notificationService = createObject("component", "/services/NotificationService")>
    <cfset reminders = notificationService.getRemindersTotal(userid)>
<cfcatch type="any">
    <cflog type="error" text="[Error in reminders_511_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
