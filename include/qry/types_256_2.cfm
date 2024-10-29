
<cftry>
    <cfset ticketTypeService = createObject("component", "services.TicketTypeService")>
    <cfset types = ticketTypeService.getTicketTypes()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_256_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
