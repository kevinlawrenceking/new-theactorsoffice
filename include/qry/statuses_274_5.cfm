
<cftry>
    <cfset statuses = createObject("component", "services.TicketStatusService").SELticketstatuses()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in statuses_274_5.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving ticket statuses." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
