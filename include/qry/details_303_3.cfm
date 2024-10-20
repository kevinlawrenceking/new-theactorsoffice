
<cftry>
    <cfset recid = 123> <!--- Example recid, replace with actual value --->
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset details = ticketService.gettickets(recid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in details_303_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
