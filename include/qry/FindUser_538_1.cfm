
<cftry>
    <cfset userService = new services.UserService()>
    <cfset FindUser = userService.gettaousers(GetAuthUser())>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindUser_538_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
