
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset users = userService.SELtaousers_24158()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in users_256_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
