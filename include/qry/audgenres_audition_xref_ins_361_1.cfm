
<cftry>
    <cfset objGenreAuditionService = createObject("component", "/services/GenreAuditionService")>
    <cfset objGenreAuditionService.UPDaudgenres_audition_xref(
        new_audRoleID = new_audRoleID,
        new_audgenreID = new_audgenreID,
        conditionValue = new_
    )>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in audgenres_audition_xref_ins_361_1.cfm]: #cfcatch.message#">
    <cfthrow>
</cfcatch>
</cftry>
