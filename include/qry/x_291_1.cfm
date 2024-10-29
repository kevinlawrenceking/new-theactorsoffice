
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset userIdsQuery = queryExecute("SELECT DISTINCT userid FROM shares", [], {datasource="abod"})>
    <cfset userIds = []>
    
    <cfloop query="userIdsQuery">
        <cfset arrayAppend(userIds, userIdsQuery.userid)>
    </cfloop>
    
    <cfset x = userService.getUsersWithShares(userIds=userIds)>
    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_291_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
