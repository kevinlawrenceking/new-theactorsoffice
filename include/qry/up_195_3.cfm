
<cftry>
    <cfset notificationService = new "/services/NotificationService.cfc"()>
    <cfset result = notificationService.updatefunotifications(
        new_notstartdate = k.new_notstartdate,
        notid = k.notid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in up_195_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
