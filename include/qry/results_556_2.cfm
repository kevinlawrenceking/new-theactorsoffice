
<cftry>
    <cfset results = createObject("component", "services.TicketService").REStickets_24785(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_556_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
