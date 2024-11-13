<cfset userService = createObject("component", "services.UserService")>
<cfquery name="userIds" datasource="abod">
    SELECT DISTINCT userid FROM shares
</cfquery>
<cfset x = userService.SELtaousers_24306(userIds=userIds)>