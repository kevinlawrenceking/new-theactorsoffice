
<cftry>
    <cfset notsNext = createObject("component", "/services/NotificationService").getfunotifications(newsuid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in notsNext_514_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
