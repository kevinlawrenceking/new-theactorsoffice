
<cftry>
    <cfset componentPath = "/services/AuditionSubmitSiteUserService.cfc">
    <cfset component = createObject("component", componentPath)>
    <cfset result = component.updateaudsubmitsites_user(
        submitsitename = new_submitsitename,
        catlist = sortedCatList,
        submitsiteid = find.submitsiteid
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_197_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
