
<cftry>
    <cfset reminders_total = 0>
    <cfset notificationService = createObject("component", "/services/NotificationService")>
    <cfset reminders_total = notificationService.getRemindersTotal(userid)><Cfabort>
<cfcatch type="any">
    <cflog type="error" text="[Error in reminders_511_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
