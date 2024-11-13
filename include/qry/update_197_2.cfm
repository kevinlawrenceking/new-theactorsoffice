<cfset componentPath = "/services/AuditionSubmitSiteUserService.cfc">
<cfset objService = createObject("component", componentPath)>
<cfset objService.UPDaudsubmitsites_user(
    new_submitsitename = new_submitsitename,
    sortedCatList = sortedCatList,
    submitsiteid = find.submitsiteid
)>
