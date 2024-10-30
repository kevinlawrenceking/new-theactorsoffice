
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfquery name="userIds" datasource="abod">
        SELECT DISTINCT userid FROM shares
    </cfquery>
    <cfset x = userService.SELtaousers_24306(userIds=userIds)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_291_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
