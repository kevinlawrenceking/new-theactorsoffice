
<cftry>
    <cfset ticketStatusService = createObject("component", "services.TicketStatusService")>
    <cfset statuses = ticketStatusService.SELticketstatuses_24781()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in statuses_554_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching ticket statuses.">
    </cfcatch>
</cftry>
