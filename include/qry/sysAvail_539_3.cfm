
<cftry>
    <cfset sysAvail = createObject("component", "services.SystemService").SELfusystems_24762(
        new_systemscope = new_systemscope, 
        currentid = currentid, 
        session_userid = session.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in sysAvail_539_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
