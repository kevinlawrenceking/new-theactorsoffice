
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset FindUser = userService.getUserDetails(userID=session.userid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in FindUser_188_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
