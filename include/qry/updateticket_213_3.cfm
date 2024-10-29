
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset ticketService.updateTicketStatus(new_ticketid=new_ticketid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updateticket_213_3.cfm] #cfcatch.message#">
        <cfthrow message="Error updating ticket status." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
