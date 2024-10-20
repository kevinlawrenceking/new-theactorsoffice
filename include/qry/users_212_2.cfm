
<cftry>
    <cfset users = createObject("component", "services.UserService").gettaousers(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in users_212_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
