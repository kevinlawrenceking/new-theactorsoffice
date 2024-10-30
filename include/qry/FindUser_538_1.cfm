
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset FindUser = userService.SELtaousers_24759(userEmail=GetAuthUser())>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindUser_538_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
