
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset uu = userService.getUserById(userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in uu_223_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving the user." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
