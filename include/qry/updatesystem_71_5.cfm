
<cftry>
    <cfset systemUserService = createObject("component", "services.SystemUserService")>
    <cfset systemUserService.UPDfusystemusers(suid=newsuid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updatesystem_71_5.cfm]: #cfcatch.message#">
        <cfthrow message="Error updating user status." detail="#cfcatch.Detail#">
    </cfcatch>
</cftry>
