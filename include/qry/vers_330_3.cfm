
<cftry>
    <cfset ticketService = createObject("component", "services.TicketService")>
    <cfset vers = ticketService.SELtickets_24480()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in vers_330_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
