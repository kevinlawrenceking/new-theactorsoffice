
<cftry>
    <cfset notificationService = new services.NotificationService()>
    <cfset notificationService.INSnotifications_23937(
        new_contactname = new_contactname,
        new_userid = new_userid,
        new_contactid = new_contactid,
        sunotes = sunotes
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in Insert_157_6.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the notification." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
