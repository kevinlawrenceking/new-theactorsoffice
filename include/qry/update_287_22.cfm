
<cftry>
    <cfset componentPath = "/services/AuditionSubmitSiteUserService.cfc">
    <cfset component = createObject("component", componentPath)>
    <cfset result = component.updateaudsubmitsites_user(new_catlist, new_submitsiteid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_287_22.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
