
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset ticketService.updatetickets(ticketid=new_ticketid)>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in updateticket_213_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
