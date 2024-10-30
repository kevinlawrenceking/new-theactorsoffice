
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset usercontact = userService.SELtaousers_23956(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in usercontact_159_14.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
