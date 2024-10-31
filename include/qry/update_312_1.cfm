
<cftry>
    <cfset ticketService = createObject("component", "/services/TicketService")>
    <cfset ticketService.UPDtickets_24384(
        ticketid = ticketid,
        new_verid = new_verid,
        new_ticketpriority = new_ticketpriority
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_312_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the ticket." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
