
<cftry>
    <cfset action_user_del = createObject("component", "services.SystemService").getActionDetails(systemID=mysystems.systemid, userID=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in action_user_del_295_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
