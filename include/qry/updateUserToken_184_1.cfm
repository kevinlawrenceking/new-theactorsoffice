
<cftry>
    <cfset userService = new services.UserService()>
    <cfset userService.UPDtaousers_23989(accesstoken="#accesstoken#", refreshToken="#refreshToken#", userid="#session.userid#")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updateUserToken_184_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating user tokens." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
