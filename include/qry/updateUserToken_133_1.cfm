
<cftry>
    <cfset userService = new services.UserService()>
    <cfset userService.UPDtaousers_23911(accessToken=authResult.access_token, userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updateUserToken_133_1.cfm] Error updating user access token: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
