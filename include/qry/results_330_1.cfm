
<cftry>
    <cfset results = createObject("component", "services.TicketService").getTickets(
        select_userid = select_userid,
        select_ticketstatus = select_ticketstatus,
        select_ticketpriority = select_ticketpriority,
        select_tickettype = select_tickettype,
        select_pgid = select_pgid,
        select_verid = select_verid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_330_1.cfm]: #cfcatch.message#"/>
    </cfcatch>
</cftry>
