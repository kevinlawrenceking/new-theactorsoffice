
<cftry>
    <cfset ticketStatusService = new "/services/TicketStatusService.cfc"()>
    <cfset statuses = ticketStatusService.getTicketStatuses()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in statuses_274_5.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving ticket statuses." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
