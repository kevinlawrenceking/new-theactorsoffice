
<cftry>
    <cfset genresService = createObject("component", "/services/AuditionGenreUserService")>
    <cfset genres = genresService.getAudGenresByUser(userid=userid, new_audcatid=new_audcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in genres_286_13.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
