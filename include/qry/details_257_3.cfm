
<cftry>
    <cfset details = createObject("component", "services.TicketService").gettickets(recid=#recid#)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_257_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
