
<cftry>
    <cfset find = createObject("component", "services.ActionUserService").SELactionusers(actionid=xs.actionid, userid=u.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in find_283_6.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching action users." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
