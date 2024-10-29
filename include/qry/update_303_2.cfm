
<cftry>
    <cfset ticketService = createObject("component", "/services/TicketService")>
    <cfset ticketService.updateTicketCompletion(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_303_2.cfm] #cfcatch.message#">
        <cfthrow message="Error in update_303_2.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
