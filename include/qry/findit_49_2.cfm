
<cftry>
    <cfset findit = createObject("component", "services.AuditionGenreUserService").getAudGenresUser(audcatid=audcatid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit_49_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
