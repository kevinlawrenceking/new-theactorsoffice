
<cftry>
    <cfset variables.sitelinkUserService = createObject("component", "/services/SiteLinkUserService")>
    <cfset variables.sitelinkUserService.updatesitelinks_user(new_id)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_113_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
