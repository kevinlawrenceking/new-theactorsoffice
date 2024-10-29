
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset usercontact = userService.getContactIdByUserId(userid=variables.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in usercontact_159_14.cfm]: #cfcatch.message#">
        <cfset usercontact = queryNew("contactid")>
    </cfcatch>
</cftry>
