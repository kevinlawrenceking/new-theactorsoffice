
<cftry>
    <cfset versions = createObject("component", "/services/TicketService").getvm_taoversions_hoursleft(results.verid, numberformat(results.col6, '99999.99'))>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in versions_323_2.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
