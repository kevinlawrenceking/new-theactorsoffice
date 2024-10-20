
<cftry>
    <cfset find = createObject("component", "services.UserService").gettaousers()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_246_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
