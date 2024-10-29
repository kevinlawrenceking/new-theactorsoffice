
<cftry>
    <cfset componentPath = "/services/AuditionSubmitSiteUserService.cfc">
    <cfset service = createObject("component", componentPath)>
    <cfset service.updateSubmitSite(
        new_submitsitename = new_submitsitename,
        sortedCatList = sortedCatList,
        submitsiteid = find.submitsiteid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_197_2.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
