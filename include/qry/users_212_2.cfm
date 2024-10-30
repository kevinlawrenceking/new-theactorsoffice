
<cftry>
    <cfset users = createObject("component", "services.UserService").SELtaousers_24072(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in users_212_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
