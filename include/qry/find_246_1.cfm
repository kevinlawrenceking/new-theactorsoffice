
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset find = userService.getLatestUserId()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_246_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
