
<cftry>
    <cfset toasts = createObject("component", "/services/NotificationService").getUnreadNotifications(userID=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in toasts_306_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
