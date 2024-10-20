
<cftry>
    <cfset ticketService = new services.TicketService()>
    <cfset result = ticketService.updatetickets(recid=recid, status="Pass")>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_302_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
