
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset ticketService.updatetickets(
        ticketId = recid,
        status = "Closed",
        completedDate = now(),
        response = "Closed by #uu.userfirstname# #uu.userlastname#"
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_299_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
