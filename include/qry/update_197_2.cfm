<cfset componentPath = "/services/AuditionSubmitSiteUserService.cfc">
<cfset objService = createObject("component", componentPath)>
<cfset objService.UPDaudsubmitsites_user(
    new_submitsitename = new_submitsitename,
    sortedCatList = sortedCatList,
    submitsiteid = find.submitsiteid
)>
<cfquery datasource="abod">
    UPDATE some_table SET isfetch = 1 WHERE some_condition
</cfquery>