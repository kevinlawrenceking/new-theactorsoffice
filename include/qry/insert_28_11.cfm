
<cftry>
    <cfset resultx = createObject("component", "services.AuditionPlatformUserService").INSaudPlatforms_user_23779(CustomPlatform=CustomPlatform, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_28_11.cfm]: #cfcatch.message#">
        <cfthrow message="Error calling INSaudPlatforms_user_23779" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
