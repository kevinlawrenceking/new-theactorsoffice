
<cftry>
    <cfset genreAuditionService = new services.GenreAuditionService()>
    <cfset genreAuditionService.insertAuditionGenreXref(
        new_audRoleID = new_audRoleID,
        new_audgenreID = new_audgenreID
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audgenres_audition_xref_ins_360_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while calling insertAuditionGenreXref." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>

