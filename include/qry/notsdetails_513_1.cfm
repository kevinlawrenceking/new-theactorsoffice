
<cftry>
    <cfset notsdetails = createObject("component", "/services/NotificationService").getfunotifications(notid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in notsdetails_513_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
