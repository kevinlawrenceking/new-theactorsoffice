
<cftry>
    <cfset componentPath = "/services/SiteLinkUserService.cfc">
    <cfset siteLinkUserService = createObject("component", componentPath)>
    <cfset siteLinkUserService.updatesitelinks_user(new_id)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_151_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
