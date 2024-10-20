
<cftry>
    <cfset sysActive = createObject("component", "services.SystemUserService").getvm_fusystemusers_fusystems(
        contactID=currentid,
        userID=session.userid,
        hideCompleted=hide_completed
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in sysActive_537_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
