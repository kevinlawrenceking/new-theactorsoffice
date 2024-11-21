<cfset userService = createObject("component", "services.UserService")>
<cfset Details = userService.GetUserDetails(userid=userid)>
<cfoutput>
<h1>Details: #Details.recordcount#</h1></cfoutput><cfaborT>