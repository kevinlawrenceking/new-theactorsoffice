
<cftry>
    <cfset var userService = createObject("component", "/services/UserService")>
    <cfset var users = userService.getActiveUserTickets(ticketActive="Y")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in users_10_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
