
<cftry>
    <cfset result = new "/services/AuditionSubmitSiteUserService.cfc"().updateaudsubmitsites_user(
        submitsitename = new_submitsitename,
        isDeleted = isdeleted,
        catlist = catlist,
        sortedCatList = sortedCatList,
        submitsiteid = submitsiteid
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_260_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
