
<cftry>
    <cfset subsites = createObject("component", "/services/AuditionSubmitSiteUserService").SELaudsubmitsites_user_24265(userid=userid, new_audcatid=new_audcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in subsites_286_5.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
