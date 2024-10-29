
<cftry>
    <cfset systemUserService = new "/services/SystemUserService.cfc"()>
    <cfset systemUserService.updateUserStatus(suid=newsuid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updatesystem_71_5.cfm]: #cfcatch.message#">
        <cfthrow message="Error updating user status." detail="#cfcatch.Detail#">
    </cfcatch>
</cftry>
