
<cftry>
    <cfset subsites = createObject("component", "services.AuditionSubmitSiteUserService").getaudsubmitsites_user(userid=userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in subsites_189_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
