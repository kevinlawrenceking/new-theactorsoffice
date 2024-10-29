
<cftry>
    <cfset ticketService = createObject("component", "/services/TicketService")>
    <cfset results = ticketService.getVersionDetails()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_557_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
