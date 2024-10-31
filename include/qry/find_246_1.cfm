
<cftry>
    <cfset userService = createObject("component", "/services/UserService")>
    <cfset find = userService.SELtaousers_24142()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_246_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
