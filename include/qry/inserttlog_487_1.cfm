
<cftry>
    <cfset objTicketsLogTableService = createObject("component", "services.TicketsLogTableService")>
    <cfset objTicketsLogTableService.INSticketslog(
        new_tlogDetails = new_tlogDetails,
        new_ticketid = new_ticketid,
        new_ticketstatus = new_ticketstatus
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in inserttlog_487_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while calling INSticketslog." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
