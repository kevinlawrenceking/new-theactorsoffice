
<cftry>
    <cfset submitSiteService = createObject("component", "/services/AuditionSubmitSiteUserService")>
    <cfset submitSiteService.UPDaudsubmitsites_user_24167(
        new_submitsitename = new_submitsitename,
        isdeleted = isdeleted,
        catlist = catlist,
        sortedCatList = sortedCatList,
        submitsiteid = submitsiteid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_260_2.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
