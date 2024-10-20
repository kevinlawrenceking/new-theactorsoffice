
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset details = ticketService.gettickets(recid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in details_274_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
