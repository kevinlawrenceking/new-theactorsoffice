
<cftry>
    <cfset genreAuditionService = new "/services/GenreAuditionService.cfc"()>
    <cfset genreAuditionService.DELaudgenres_audition_xref(new_audroleid=new_audroleid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in delete_287_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
