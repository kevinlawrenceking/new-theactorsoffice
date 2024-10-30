
<cftry>
    <cfset notificationService = new "/services/NotificationService.cfc"()>
    <cfset notificationService.INSfunotifications_24431(
        actionID = addDaysNo.actionID,
        userid = userid,
        NewSuid = NewSuid,
        notstartdate = notstartdate
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addNotification_315_38.cfm]: #cfcatch.message#"/>
        <cfthrow>
    </cfcatch>
</cftry>
