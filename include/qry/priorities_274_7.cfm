
<cftry>
    <cfset priorities = createObject("component", "services.TicketPriorityService").getticketpriority()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in priorities_274_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
