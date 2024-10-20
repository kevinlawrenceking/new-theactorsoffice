
<cftry>
    <cfset userService = new services.UserService()>
    <cfset users = userService.gettaousers(select_userid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in users_318_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
