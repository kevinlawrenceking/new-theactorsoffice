
<cftry>
    <cfset ticketService = createObject("component", "/services/TicketService")>
    <cfset details = ticketService.DETtickets_24767(recid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_543_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
