
<cftry>
    <cfset findit = createObject("component", "services.AuditionGenreUserService").SELaudgenres_user(audcatid=audcatid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit_49_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
