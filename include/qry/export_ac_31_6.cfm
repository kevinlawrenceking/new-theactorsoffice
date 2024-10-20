
<cftry>
    <cfset genreAuditionService = createObject("component", "/services/GenreAuditionService")>
    <cfset export_ac = genreAuditionService.getaudgenres_audition_xref(
        essencename = "someEssenceName",
        audroleid = someAudRoleId,
        userid = someUserId,
        orderBy = "audroleid"
    )>
    <!--- Additional logic to handle the result of the fetch --->
<cfcatch>
    <cflog file="errorLog" type="error" text="[Error in export_ac_31_6.cfm]: #cfcatch.message#. Detail: #cfcatch.detail#">
</cfcatch>
</cftry>

