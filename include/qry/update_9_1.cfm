
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset ticketService.updateTicket(
        ticketid = ticketid,
        new_ticketname = new_ticketname,
        new_ticketdetails = new_ticketdetails,
        new_ticketresponse = new_ticketresponse,
        new_ticketStatus = new_ticketStatus,
        new_ticketType = new_ticketType,
        new_testingscript = new_testingscript,
        new_patchNote = new_patchNote,
        new_environ = new_environ,
        new_ticketPriority = new_ticketPriority,
        new_userid = (isNumeric(new_userid) AND new_userid NEQ "") ? new_userid : null,
        new_verid = (isNumeric(new_verid) AND new_verid NEQ "") ? new_verid : null,
        new_pgid = (isNumeric(new_pgid) AND new_pgid NEQ "") ? new_pgid : null,
        new_esthours = (isNumeric(new_esthours) AND new_esthours NEQ "") ? decimalformat(new_esthours) : null
    )>
<cfcatch>
    <cflog file="errorLog"
           text="[Error in update_9_1.cfm] Failed to update ticket. Error: #cfcatch.message#">
</cfcatch>
</cftry>
