
<cftry>
    <cfset sysActive = createObject("component", "services.SystemUserService").getUserSystemDetails(
        currentid = currentid,
        sessionUserId = session.userid,
        hideCompleted = hide_completed
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in sysActive_537_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching system user details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
