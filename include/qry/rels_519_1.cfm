
<cftry>
    <cfset rels = createObject("component", "services.SystemUserService").SELfusystemusers_24718(
        currentid = currentid,
        sessionUserId = session.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in rels_519_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
