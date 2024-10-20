
<cftry>
    <cfset userService = new services.UserService()>
    <cfset userService.updatetaousers(accessToken=accessToken, userid=session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in updateUserToken_184_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
