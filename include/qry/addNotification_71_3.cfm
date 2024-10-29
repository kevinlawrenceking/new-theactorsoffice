
<cftry>
    <cfset notificationService = new "/services/NotificationService.cfc" />
    <cfset notificationService.INSfunotifications_23817(
        actionID = notsdetails.actionID,
        userid = userid,
        NewSuid = NewSuid,
        newest_notstartdate = newest_notstartdate
    ) />
<cfcatch>
    <cflog file="errorLog" text="[Error in addNotification_71_3.cfm]: #cfcatch.message#" />
    <cfthrow message="Error calling INSfunotifications_23817." detail="#cfcatch.detail#" />
</cfcatch>
</cftry>
