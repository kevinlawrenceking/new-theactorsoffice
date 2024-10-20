
<cftry>
    <cfset resultx = createObject("component", "/services/AuditionPlatformsUserService").insertaudPlatforms_user(CustomPlatform, userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_28_11.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
