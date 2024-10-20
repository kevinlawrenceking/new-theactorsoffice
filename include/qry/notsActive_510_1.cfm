
<cftry>
    <cfset notsActive = createObject("component", "/services/NotificationService").getfunotifications(
        currentid = currentid,
        suid = sysActive.suid,
        userid = session.userid,
        hide_completed = hide_completed
    )>
<cfcatch>
    <cfset errorLog("[Error in notsActive_510_1.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
