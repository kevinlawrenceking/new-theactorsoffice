
<!--- This ColdFusion page handles the insertion of a new submission site into the database. --->

<cftry>
    <cfset variables.service = new "/services/AuditionSubmitSiteUserService.cfc"()>
    <cfset variables.service.insertAudSubmitSitesUser(
        new_submitsitename = new_submitsitename,
        sortedCatList = sortedCatList,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_197_3.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
