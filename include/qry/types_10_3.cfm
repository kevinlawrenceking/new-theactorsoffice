
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset types = userService.getActiveTicketTypes(ticketActive="Y")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_10_3.cfm]: #cfcatch.message#">
        <cfset types = queryNew("tickettype")>
    </cfcatch>
</cftry>
