
<cftry>
    <cfset objService = createObject("component", "services.AuditionSubmitSiteUserService")>
    <cfset objService.updateSubmitSite(
        new_submitsitename = new_submitsitename,
        isdeleted = isdeleted,
        catlist = catlist,
        sortedCatList = sortedCatList,
        submitsiteid = submitsiteid
    )>
    <cfquery datasource="yourDataSource">
        UPDATE audsubmitsites_user
        SET isfetch = 1
        WHERE submitsiteid = #submitsiteid#
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in update_260_2.cfm]: #cfcatch.message#" type="error">
</cfcatch>
</cftry>
