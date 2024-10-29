
<cftry>
    <cfset genreAuditionService = createObject("component", "/services/GenreAuditionService")>
    <cfset genreAuditionService.deleteAudGenresAuditionXref(new_audroleid=new_audroleid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in delete_287_3.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while deleting the record." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
