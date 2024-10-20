
<cftry>
    <cfset u = createObject("component", "services.UserService").gettaousers(select_userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in u_318_30.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
