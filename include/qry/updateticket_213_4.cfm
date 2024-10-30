
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset ticketService.UPDtickets_24077(new_ticketid=new_ticketid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updateticket_213_4.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
