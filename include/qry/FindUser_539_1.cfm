
<cftry>
    <cfset userService = createObject("component", "/services/UserService")>
    <cfset FindUser = userService.SELtaousers_24760(userEmail=GetAuthUser())>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindUser_539_1.cfm]: #cfcatch.message#">
        <cfset FindUser = queryNew("userid,userFirstName,userLastName,userEmail,userRole")>
    </cfcatch>
</cftry>
