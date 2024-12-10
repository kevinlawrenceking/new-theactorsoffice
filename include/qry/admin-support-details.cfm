<!--- This ColdFusion page fetches ticket details and ticket log information based on a given record ID. --->
<cfset ticketService = createObject("component", "services.TicketService")>

<!--- Fetch ticket details using the Ticket_det function --->
<cfset ticketDetails = ticketService.Ticket_det(recid = #recid#)>

<!--- Fetch ticket log using the DETtickets_24782 function --->
<cfset ticketLog = ticketService.DETtickets_24782(recid = #recid#)>
