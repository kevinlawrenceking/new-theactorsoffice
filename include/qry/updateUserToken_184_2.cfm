
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset userService.UPDtaousers_23990(accessToken="#accessToken#", userid="#session.userid#")>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in updateUserToken_184_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the access token." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
