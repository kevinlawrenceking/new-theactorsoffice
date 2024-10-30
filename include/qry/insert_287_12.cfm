
<cftry>
    <cfset objGenreAuditionService = createObject("component", "/services/GenreAuditionService")>
    <cfset objGenreAuditionService.INSaudgenres_audition_xref(new_audgenreid=new_audgenreid, new_audroleid=new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_287_12.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
