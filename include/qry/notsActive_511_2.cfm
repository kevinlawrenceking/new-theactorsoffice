
<cftry>
    <cfset notsActive = createObject("component", "services.NotificationService").getNotifications(userID=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notsActive_511_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
