
<cftry>
    <cfset userService = createObject("component", "/services/UserService").init()>
    <cfset users = userService.getUserDetails(select_userid=select_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in users_318_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
