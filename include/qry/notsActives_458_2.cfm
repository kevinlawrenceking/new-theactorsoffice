
<cftry>
    <cfset notsActives = createObject("component", "/services/NotificationService").getNotificationsCount(userid=#userid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notsActives_458_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving notifications count." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
