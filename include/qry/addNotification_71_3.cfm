
<cftry>
    <cfset notificationService = new services.NotificationService()>
    <cfset notificationService.INSfunotifications_23817(
        actionID = notsdetails.actionID,
        userid = userid,
        NewSuid = NewSuid,
        newest_notstartdate = newest_notstartdate
    )>
<cfcatch>
    <cflog file="errorLog" text="[Error in addNotification_71_3.cfm]: #cfcatch.message#">
    <cfthrow message="Error in addNotification_71_3.cfm" detail="#cfcatch.detail#">
</cfcatch>
</cftry>
