<cfset ticketStatusService = createObject("component", "services.TicketStatusService")>
<cfset statuses = ticketStatusService.SELticketstatuses()>