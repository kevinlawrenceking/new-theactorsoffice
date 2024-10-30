
<cftry>
    <cfset details = createObject("component", "services.TicketService").DETtickets_24109(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_223_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
