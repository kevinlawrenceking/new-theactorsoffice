
<cftry>
    <cfset ticketService = createObject("component", "services.TicketTestUserService")>
    <cfset find = ticketService.getTicketTestUsers(recid=recid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_212_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
