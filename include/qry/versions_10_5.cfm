
<cftry>
    <cfset versions = createObject("component", "services.TicketService").SELtickets_23720(verid=results.verid, col6=numberformat(results.col6, '99999.99'))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in versions_10_5.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while fetching version details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
