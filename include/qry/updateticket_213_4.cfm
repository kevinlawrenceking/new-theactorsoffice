
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset ticketService.updatetickets(new_ticketid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in updateticket_213_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
