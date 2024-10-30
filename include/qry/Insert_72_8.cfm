
<cftry>
    <cfset objNotificationService = createObject("component", "services.NotificationService")>
    <cfset objNotificationService.INSnotifications_23830(
        new_contactname = new_contactname, 
        contactid = contactid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Insert_72_8.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
