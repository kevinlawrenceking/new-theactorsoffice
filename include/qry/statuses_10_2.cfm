
<cftry>
    <cfset statuses = createObject("component", "services.TicketService").SELtickets()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in statuses_10_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving ticket statuses." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
