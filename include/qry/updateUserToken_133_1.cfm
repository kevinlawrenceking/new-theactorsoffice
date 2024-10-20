
<cftry>
    <!--- Call the updatetaousers function from the UserService component --->
    <cfset variables.userService = new services.UserService()>
    <cfset variables.userService.updatetaousers(authResult.access_token, session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in updateUserToken_133_1.cfm]: " & cfcatch.message>
        <!--- Handle the error as needed --->
    </cfcatch>
</cftry>
