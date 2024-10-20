
<cftry>
    <cfset notsActives = createObject("component", "/services/NotificationService").getfunotifications(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in notsActives_458_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
