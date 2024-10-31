
<cftry>
    <cfset notificationService = createObject("component", "/services/NotificationService")>
    <cfset notificationService.INSfunotifications_24476(
        actionID = addDaysNo.actionID,
        userid = userid,
        NewSUID = NewSUID,
        notstartdate = notstartdate
    )>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in addNotification_326_1.cfm]: #cfcatch.message#">
    <cfthrow>
</cfcatch>
</cftry>
