
<cftry>
    <cfset results = createObject("component", "services.TicketService").getTickets(statusList=["Implemented", "Testing"])>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_544_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
