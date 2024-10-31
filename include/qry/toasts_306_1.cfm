
<cftry>
    <cfset toasts = createObject("component", "services.NotificationService").SELnotifications(userID=session.userid)>

    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in toasts_306_1.cfm]: #cfcatch.message#">
        <cfset toasts = queryNew("")>
    </cfcatch>
</cftry>
