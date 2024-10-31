
<cftry>
    <cfset toastmenu = createObject("component", "services.NotificationService").SELnotifications_24351(userID=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in toastmenu_306_2.cfm]: #cfcatch.message#">
        <cfset toastmenu = queryNew("ID, notiftitle, notiftimestamp, recordname, subtitle, notifurl, contactid, read, trash")>
    </cfcatch>
</cftry>
