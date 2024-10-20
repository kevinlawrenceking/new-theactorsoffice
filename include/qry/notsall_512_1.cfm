
<cftry>
    <cfset notsall = createObject("component", "/services/NotificationService").getfunotifications(currentid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in notsall_512_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
