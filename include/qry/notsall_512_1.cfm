
<cftry>
    <cfset notsall = createObject("component", "/services/NotificationService").getNotificationIDs(currentid=#currentid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notsall_512_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while fetching notification IDs." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
