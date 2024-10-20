
<cftry>
    <cfset versions = createObject("component", "/services/TicketService").getvm_taoversions_hoursleft(results.verid, numberformat(results.col6, '99999.99'))>
<cfcatch>
    <cfset errorLog = "[Error in versions_10_5.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
