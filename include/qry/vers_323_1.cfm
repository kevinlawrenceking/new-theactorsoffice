
<cftry>
    <cfset ticketService = createObject("component", "/services/TicketService")>
    <cfset vers = ticketService.getVersionDetails()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in vers_323_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
