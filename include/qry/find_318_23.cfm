
<cftry>
    <cfset find = createObject("component", "services.ActionUserService").getactionusers(xs.actionid, users.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_23.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
