
<cftry>
    <cfset notsActives = createObject("component", "services.NotificationService").getNotificationCount(userid=#userid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notsActives_461_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching notifications count." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
