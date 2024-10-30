
<cftry>
    <cfset ticketService = createObject("component", "services.TicketService")>
    <cfset versions = ticketService.SELtickets_24473(verid=results.verid, col6=numberformat(results.col6, '99999.99'))>
    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in versions_323_2.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving available versions." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
