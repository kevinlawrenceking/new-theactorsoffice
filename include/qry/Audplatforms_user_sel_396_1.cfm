
<cftry>
    <cfset Audplatforms_user_sel = createObject("component", "/services/AuditionPlatformsUserService").getaudPlatforms_user(new_userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Audplatforms_user_sel_396_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
