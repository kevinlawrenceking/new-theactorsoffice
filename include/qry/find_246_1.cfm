
<cftry>
    <cfset userService = new "/services/UserService.cfc"()>
    <cfset find = userService.SELtaousers_24142()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_246_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
