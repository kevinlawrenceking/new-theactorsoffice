
<cftry>
    <cfset notsActive = createObject("component", "/services/NotificationService").getfunotifications(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in notsActive_511_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
