
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset ticketService.updatetickets(recid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in deleteticket_105_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
