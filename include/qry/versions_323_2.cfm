
<cftry>
    <cfset versions = createObject("component", "services.TicketService").getAvailableVersions(verid=results.verid, col6=numberformat(results.col6, '99999.99'))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in versions_323_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching version information." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
