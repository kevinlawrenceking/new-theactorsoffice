
<cftry>
    <cfset ticketService = createObject("component", "services.TicketService")>
    <cfset statuses = ticketService.getDistinctTicketStatuses()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in statuses_10_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching ticket statuses." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
