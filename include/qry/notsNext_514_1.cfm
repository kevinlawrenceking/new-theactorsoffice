
<cftry>
    <cfset notsNext = createObject("component", "services.NotificationService").getNotifications(newsuid=#newsuid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notsNext_514_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
