
<cftry>
    <cfset notsdetails = createObject("component", "services.NotificationService").getNotificationDetails(notid=#notid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notsdetails_513_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
