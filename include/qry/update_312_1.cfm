
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc" />
    <cfset update = ticketService.updatetickets(
        new_verid = new_verid,
        new_ticketpriority = new_ticketpriority,
        ticketid = ticketid
    ) />
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_312_1.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
