<cfset ticketService = createObject("component", "services.TicketService")>
<cfset results = ticketService.REStickets_24478(
    select_userid=select_userid,
    select_ticketstatus=select_ticketstatus,
    select_ticketpriority=select_ticketpriority,
    select_tickettype=select_tickettype,
    select_pgid=select_pgid,
    select_verid=select_verid
)>