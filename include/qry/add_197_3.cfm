
<cftry>
    <cfset variables.service = createObject("component", "services.AuditionSubmitSiteUserService")>
    <cfset variables.service.INSaudsubmitsites_user(
        new_submitsitename = new_submitsitename,
        sortedCatList = sortedCatList,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_197_3.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
