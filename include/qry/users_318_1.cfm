
<cftry>
    <cfset users = createObject("component", "services.UserService").SELtaousers_24432(select_userid=select_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in users_318_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
