<!--- This ColdFusion page fetches ticket details and ticket log information based on a given record ID. --->
<cfset ticketService = createObject("component", "services.TicketsService")>

<!--- Fetch ticket details using the Ticket_det function --->
<cfset ticketDetails = ticketService.Ticket_det(recid = #recid#)>

<!--- Fetch ticket log using the TicketLog_res function --->
<cfset ticketLog = ticketService.TicketLog_res(recid = #recid#)>
