
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset FindUser = userService.getUserByEmail(userEmail=GetAuthUser())>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindUser_538_1.cfm]: #cfcatch.message#">
        <cfset FindUser = queryNew("userid,userFirstName,userLastName,userEmail,userRole")>
    </cfcatch>
</cftry>
