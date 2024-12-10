<!--- This ColdFusion page fetches ticket details, statuses, types, priorities, active pages, users, and versions from various services. --->

<cfset ticketService = createObject("component", "services.TicketService")>
<cfset ticketStatusService = createObject("component", "services.ticketStatusService")>
<cfset ticketTypeService = createObject("component", "services.ticketTypeService")>

<!--- Fetch ticket details using the Ticket_det function --->
<cfset ticketDetails = ticketService.DETtickets(recid = #recid#)>
<cfset ticketStatuses = ticketStatusService.SELticketstatuses()>

<!--- Fetch the ticket types using the types_sel function --->
<cfset ticketTypeService = ticketTypeService.types_sel()>

<!--- Fetch the ticket priorities --->
<cfset ticketPriorityService = createObject("component", "services.ticketPriorityService")>
<cfset ticketPriorities = ticketicketPriorityServicetService.priorities_sel()>

<!--- Fetch active pages using the pages_sel function from PageService --->
<cfset pageService = createObject("component", "services.PageService")>
<cfset activePages = pageService.pages_sel()>
<cfset pages = pageService.pages_sel()>

<!--- Fetch users using the users_sel function from UserService --->
<cfset userService = createObject("component", "services.UserService")>
<cfset users = userService.users_sel()>

<!--- Call the versions_sel function from VersionsService --->
<cfset versionService = createObject("component", "services.VersionsService")>
<cfset vers = versionService.versions_sel()>
