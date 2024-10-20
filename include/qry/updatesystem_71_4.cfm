
<cftry>
    <cfset notificationService = new "/services/NotificationService.cfc"()>
    <cfset result = notificationService.updatefunotifications(
        notstatus = "Pending",
        notstartdate = (notsnext.notstartdate is "") ? DateFormat(new_notstartdate, "yyyy-mm-dd") : notsnext.notstartdate,
        notid = notsnext.notid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in updatesystem_71_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
