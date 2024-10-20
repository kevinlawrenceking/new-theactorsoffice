
<cftry>
    <cfset subsites = createObject("component", "services.AuditionSubmitSiteUserService").getaudsubmitsites_user(userid=userid, new_audcatid=new_audcatid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in subsites_286_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
