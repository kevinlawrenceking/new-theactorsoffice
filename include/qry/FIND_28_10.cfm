
<cftry>
    <cfset FIND = createObject("component", "services.AuditionPlatformUserService").SELaudPlatforms_user_23778(userid=userid, CustomPlatform=CustomPlatform) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FIND_28_10.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
