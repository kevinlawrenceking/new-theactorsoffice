
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset u = userService.getUserById(select_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in u_318_30.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
