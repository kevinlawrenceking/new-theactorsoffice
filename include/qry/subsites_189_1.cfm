
<cftry>
    <cfset subsites = createObject("component", "services.AuditionSubmitSiteUserService").SELaudsubmitsites_user(userid=userid)>

    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in subsites_189_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
