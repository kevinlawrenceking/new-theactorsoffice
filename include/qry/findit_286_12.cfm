
<cftry>
    <cfset findit = createObject("component", "services.AuditionGenreUserService").getAudGenresUser(new_audcatid=new_audcatid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit_286_12.cfm]: #cfcatch.message#">
        <cfthrow message="Error executing fetch in findit_286_12.cfm." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
