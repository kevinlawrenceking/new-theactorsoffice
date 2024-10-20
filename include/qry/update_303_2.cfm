
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc" />
    <cfset result = ticketService.updatetickets(recid=recid, ticketCompletedDate=now(), complete_email=1) />
    <cfset isfetch = 1 />
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_303_2.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
