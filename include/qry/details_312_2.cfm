
<cftry>
    <cfset details = createObject("component", "services.TicketService").getTicketStatus(ticketid=arguments.ticketid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_312_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
