
<cftry>
    <cfset u = createObject("component", "services.UserService").SELtaousers_24461(userid=select_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in u_318_30.cfm]: #cfcatch.message#">
        <cfset u = queryNew("")>
    </cfcatch>
</cftry>
