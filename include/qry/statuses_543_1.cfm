
<cftry>
    <cfset ticketStatusService = createObject("component", "services.TicketStatusService")>
    <cfset statuses = ticketStatusService.getTicketStatuses()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in statuses_543_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
