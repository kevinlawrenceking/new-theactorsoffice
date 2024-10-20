
<cftry>
    <cfset recid = 123> <!--- Example ticket ID --->
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset details = ticketService.gettickets(recid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in details_543_2.cfm]: " & cfcatch.message>
    <cflog text="#errorLog#" type="error">
</cfcatch>
</cftry>
