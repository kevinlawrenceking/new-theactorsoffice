
<cftry>
    <cfset ticketsLogService = new "/services/TicketsLogTableService.cfc"()>
    <cfset ticketsLogService.insertticketslog(
        tlogDetails = new_tlogDetails,
        userID = session.userid,
        ticketid = new_ticketid,
        ticketstatus = new_ticketstatus
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in inserttlog_487_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
