
<cftry>
    <cfset results = createObject("component", "services.TicketService").gettickets()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in results_544_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
