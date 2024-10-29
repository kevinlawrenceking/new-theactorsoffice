
<cftry>
    <cfset statuses = createObject("component", "/services/TicketStatusService").getTicketStatuses()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in statuses_554_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving ticket statuses.">
    </cfcatch>
</cftry>
