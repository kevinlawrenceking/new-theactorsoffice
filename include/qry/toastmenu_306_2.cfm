
<cftry>
    <cfset toastmenu = createObject("component", "/services/NotificationService").getnotifications(session.userid)>
<cfcatch>
    <cfset errorLog = "[Error in toastmenu_306_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
