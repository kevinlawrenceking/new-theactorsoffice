
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset vers = ticketService.gettickets()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in vers_323_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
