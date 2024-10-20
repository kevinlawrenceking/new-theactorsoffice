
<cftry>
    <cfset TicketService = new "/services/TicketService.cfc"()>
    <cfset TicketService.updatetickets(
        ticketCompletedDate = now(),
        ticketstatus = "Completed",
        ticketresponse = ticketresponse,
        verid = next_verid,
        patchnote = patchnote,
        complete_email = 1,
        ticketid = recid
    )>
    <cfcatch type="any">
        <cfset errorLog("[Error in update_300_2.cfm]: #cfcatch.message#")>
    </cfcatch>
</cftry>
