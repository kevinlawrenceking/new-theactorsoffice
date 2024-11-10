<cfset submitSiteService = createObject("component", "services.AuditionSubmitSiteUserService")>
<cfset submitSiteService.UPDaudsubmitsites_user_24167(
    new_submitsitename = new_submitsitename,
    isdeleted = isdeleted,
    catlist = catlist,
    sortedCatList = sortedCatList,
    submitsiteid = submitsiteid
)>