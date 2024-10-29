
<cftry>
    <cfset ticketService = createObject("component", "services.TicketService")>
    <cfset details = ticketService.getTicketDetails(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_274_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
