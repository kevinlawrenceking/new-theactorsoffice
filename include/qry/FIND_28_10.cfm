
<cftry>
    <cfset FIND = createObject("component", "services.AuditionPlatformsUserService").getaudPlatforms_user(userid=userid, audplatform=CustomPlatform)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FIND_28_10.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
