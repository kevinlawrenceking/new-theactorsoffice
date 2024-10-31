
<cftry>
    <cfset var ticketService = createObject("component", "services.TicketService")>
    <cfset var results = ticketService.REStickets_24787()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_557_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
