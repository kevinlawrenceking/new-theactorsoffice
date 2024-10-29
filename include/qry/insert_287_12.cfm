
<cftry>
    <cfset genreAuditionService = new "/services/GenreAuditionService.cfc"()>
    <cfset genreAuditionService.insertAuditionGenreRole(new_audgenreid=new_audgenreid, new_audroleid=new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_287_12.cfm]: #cfcatch.message#">
        <cfthrow message="Error in insert_287_12.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
