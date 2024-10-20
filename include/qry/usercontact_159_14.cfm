
<cftry>
    <cfset userService = new services.UserService()>
    <cfset usercontact = userService.gettaousers(userid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in usercontact_159_14.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
