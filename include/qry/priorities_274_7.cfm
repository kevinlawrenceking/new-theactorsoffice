
<cftry>
    <cfset priorities = createObject("component", "services.TicketPriorityService").SELticketpriority()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in priorities_274_7.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
