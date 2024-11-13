<cfset userService = createObject("component", "services.UserService")>
<cfquery result="result" name="userIds" datasource="abod">
    SELECT DISTINCT userid FROM shares
</cfquery>
<cfset x = userService.SELtaousers_24306(userIds=userIds)>