
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset ticketService.UPDtickets_23866(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in deleteticket_105_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the ticket status." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
