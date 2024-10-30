
<cftry>
    <cfset details = createObject("component", "services.TicketService").DETtickets_24208(recid=#recid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_274_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
