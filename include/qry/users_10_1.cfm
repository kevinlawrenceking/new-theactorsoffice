
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset users = userService.SELtaousers(ticketActive="Y")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in users_10_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
