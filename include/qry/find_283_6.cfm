
<cftry>
    <cfset find = createObject("component", "services.ActionUserService").getactionusers(xs.actionid, u.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_283_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
