
<cftry>
    <cfset details = createObject("component", "services.TicketService").gettickets(recid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_212_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
