
<cftry>
    <cfset details = createObject("component", "services.TicketService").DETtickets_24385(ticketid=#ticketid#)>

    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_312_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
