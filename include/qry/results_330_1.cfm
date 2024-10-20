
<cftry>
    <cfset results = createObject("component", "/services/TicketService").gettickets(
        select_userid=select_userid, 
        select_ticketstatus=select_ticketstatus, 
        select_ticketpriority=select_ticketpriority, 
        select_tickettype=select_tickettype, 
        select_pgid=select_pgid, 
        select_verid=select_verid
    )>
<cfcatch type="any">
    <cfset errorLog = "[Error in results_330_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
