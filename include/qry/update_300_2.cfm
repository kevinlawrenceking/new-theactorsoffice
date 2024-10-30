
<cftry>
    <cfset ticketService = createObject("component", "services.TicketService")>
    <cfset ticketService.UPDtickets_24337(
        ticketresponse="#ticketresponse#",
        next_verid=#next_verid#,
        patchnote="#patchnote#",
        recid=#recid#
    )>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in update_300_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
