
<cftry>
    <cfset notsActive = createObject("component", "/services/NotificationService").SELfunotifications_24706(
        currentid = currentid,
        sysActiveSuid = sysActive.suid,
        sessionUserid = session.userid,
        hideCompleted = hide_completed
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notsActive_510_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while fetching notifications." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
