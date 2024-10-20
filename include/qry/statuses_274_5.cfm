
<cftry>
    <cfset statuses = createObject("component", "services.TicketStatusService").getticketstatuses()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in statuses_274_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
