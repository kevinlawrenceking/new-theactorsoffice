
<cftry>
    <cfset notsActives = createObject("component", "/services/NotificationService").getfunotifications(userid)>
    <cfcatch>
        <cfset errorLog = "[Error in notsActives_461_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
