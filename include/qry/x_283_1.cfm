
<cftry>
    <cfset x = createObject("component", "services.NotificationService").getfunotifications()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_283_1.cfm]: " & cfcatch.message>
        <!--- Handle the error logging here --->
    </cfcatch>
</cftry>
