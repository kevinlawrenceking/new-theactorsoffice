
<cftry>
    <cfset toasts = createObject("component", "/services/NotificationService").getnotifications(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in toasts_306_1.cfm]: " & cfcatch.message>
        <!--- Handle the error as needed --->
    </cfcatch>
</cftry>
