
<cftry>
    <cfset sysActive = createObject("component", "services.SystemUserService").SELfusystemusers_24758(
        currentid = currentid,
        sessionUserId = session.userid,
        hideCompleted = hide_completed
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in sysActive_537_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving system users." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
