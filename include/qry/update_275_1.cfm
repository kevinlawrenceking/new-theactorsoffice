
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc" />
    <cfset ticketService.updatetickets(
        new_ticketname = new_ticketname,
        new_testingscript = new_testingscript,
        new_ticketType = new_ticketType,
        new_ticketStatus = new_ticketStatus,
        new_verid = new_verid,
        new_pgid = new_pgid,
        new_customtestpagename = new_customtestpagename,
        new_customtestpagelink = new_customtestpagelink,
        new_ticketPriority = new_ticketPriority,
        new_esthours = numberformat(new_esthours, "9.99"),
        ticketid = ticketid
    ) />
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in update_275_1.cfm]: #cfcatch.message#" />
</cfcatch>
</cftry>
