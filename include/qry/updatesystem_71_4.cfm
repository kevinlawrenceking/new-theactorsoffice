<cfset notificationService = createObject("component", "services.NotificationService")>
<cfset notificationService.UPDfunotifications_23818(
    notid = notsnext.notid,
    new_notstartdate = (notsnext.notstartdate EQ "") ? new_notstartdate : ""
)>