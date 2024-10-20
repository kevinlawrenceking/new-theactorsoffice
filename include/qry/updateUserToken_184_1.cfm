
<cftry>
    <cfset userService = new "/services/UserService.cfc">
    <cfset userService.updatetaousers(accesstoken=accesstoken, refreshToken=refreshToken, userid=session.userid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in updateUserToken_184_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
