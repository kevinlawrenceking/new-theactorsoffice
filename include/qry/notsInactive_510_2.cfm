
<cftry>
    <cfset notsInactive = createObject("component", "services.NotificationStatusService").SELnotstatuses(
        currentid = currentid,
        sysActiveSuid = sysActive.suid,
        sessionUserid = session.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notsInactive_510_2.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
