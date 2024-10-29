
<cftry>
    <cfset variables.notificationService = createObject("component", "/services/NotificationService")>
    <cfset variables.notificationService.insertNotification(
        new_contactname = new_contactname,
        contactid = contactid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Insert_72_8.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
