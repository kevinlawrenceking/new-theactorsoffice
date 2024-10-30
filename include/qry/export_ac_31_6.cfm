
<cftry>
    <cfset genreAuditionService = createObject("component", "services.GenreAuditionService")>
    <cfset export_ac = genreAuditionService.SELaudgenres_audition_xref(projectList="#projectlist#")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in export_ac_31_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
