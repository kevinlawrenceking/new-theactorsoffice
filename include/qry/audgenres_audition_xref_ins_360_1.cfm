
<cftry>
    <cfset variables.genreAuditionService = createObject("component", "services.GenreAuditionService")>
    <cfset variables.genreAuditionService.INSaudgenres_audition_xref_24521(
        new_audRoleID=new_audRoleID,
        new_audgenreID=new_audgenreID
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audgenres_audition_xref_ins_360_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while calling the INSaudgenres_audition_xref_24521 function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
