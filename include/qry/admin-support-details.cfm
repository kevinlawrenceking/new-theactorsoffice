<!--- This ColdFusion page fetches ticket details and ticket log information based on a given record ID. --->
<cfset ticketService = createObject("component", "services.TicketService")>

<!--- Fetch ticket details using the DETtickets_24109 function --->
<cfset ticketDetails = ticketService.DETtickets_24109(recid = #recid#)>

<!--- Fetch ticket log using the REStickets_24785 function --->
<cfset ticketLog = ticketService.REStickets_24785(recid = #recid#)>
