
<cftry>
    <cfset details = createObject("component", "services.TicketService").gettickets(ticketid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_275_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
