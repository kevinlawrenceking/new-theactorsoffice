
<cftry>
    <cfset ticketTestUserService = new "/services/TicketTestUserService.cfc"()>
    <cfset ticketTestUserService.inserttickettestusers(
        ticketid = new_ticketid,
        userid = new_userid,
        teststatus = new_teststatus,
        rejectNotes = new_rejectnotes
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in Insert_213_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
