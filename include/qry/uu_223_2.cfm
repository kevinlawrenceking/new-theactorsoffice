
<cftry>
    <cfset uu = createObject("component", "services.UserService").gettaousers(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in uu_223_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
