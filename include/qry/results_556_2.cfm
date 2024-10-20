
<cftry>
    <cfset results = createObject("component", "services.TicketService").gettickets(recid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in results_556_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
