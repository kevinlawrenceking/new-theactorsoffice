
<cftry>
    <cfset ticketService = createObject("component", "services.TicketService")>
    <cfset ticketService.UPDtickets_24332(recid=#recid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_303_2.cfm] #cfcatch.message#">
        <cfthrow message="Error updating ticket completion." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
