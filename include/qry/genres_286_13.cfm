
<cftry>
    <cfset genres = createObject("component", "services.AuditionGenreUserService").SELaudgenres_user_24273(userid=userid, new_audcatid=new_audcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in genres_286_13.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
