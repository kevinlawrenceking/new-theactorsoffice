
<cftry>
    <cfset details = createObject("component", "services.TicketService").getTicketDetails(ticketid=ticketid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_275_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching ticket details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
