
<cftry>
    <cfset ticketService = createObject("component", "/services/TicketService")>
    <cfset ticketService.UPDtickets_24076(new_ticketid=new_ticketid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updateticket_213_3.cfm] #cfcatch.message#">
        <cfthrow message="Error updating ticket status." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
