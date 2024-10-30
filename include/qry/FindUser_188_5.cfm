
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset FindUser = userService.SELtaousers_24002(userID=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindUser_188_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
