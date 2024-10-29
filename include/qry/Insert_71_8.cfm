
<cftry>
    <cfset variables.notificationService = createObject("component", "services.NotificationService")>
    <cfset variables.notificationService.insertNotification(
        new_contactname = new_contactname,
        userid = userid,
        contactid = contactid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Insert_71_8.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting notification." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
