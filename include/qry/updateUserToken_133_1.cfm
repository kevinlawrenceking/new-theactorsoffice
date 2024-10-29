
<cftry>
    <cfset userService = createObject("component", "/services/UserService")>
    <cfset userService.updateUserAccessToken(accessToken=authResult.access_token, userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updateUserToken_133_1.cfm] #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
