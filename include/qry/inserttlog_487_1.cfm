
<cftry>
    <cfset objTicketsLogTableService = createObject("component", "services.TicketsLogTableService")>
    <cfset objTicketsLogTableService.insertTicketLog(
        new_tlogDetails = new_tlogDetails,
        new_ticketid = new_ticketid,
        new_ticketstatus = new_ticketstatus
    )>
    <cfquery datasource="abod">
        UPDATE database SET isfetch = 1 WHERE condition
    </cfquery>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in inserttlog_487_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the ticket log." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
