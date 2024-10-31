
<cftry>
    <cfset notificationService = createObject("component", "/services/NotificationService")>
    <cfset notificationService.UPDfunotifications_23818(
        notid = notsnext.notid,
        new_notstartdate = (notsnext.notstartdate EQ "") ? new_notstartdate : ""
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updatesystem_71_4.cfm] #cfcatch.message#">
        <cfthrow message="Error updating notification status." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
