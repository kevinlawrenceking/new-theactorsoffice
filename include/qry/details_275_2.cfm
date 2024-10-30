
<cftry>
    <cfset details = createObject("component", "services.TicketService").DETtickets_24217(ticketid=ticketid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_275_2.cfm]: #cfcatch.message#" />
        <cfthrow message="An error occurred while retrieving ticket details." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
