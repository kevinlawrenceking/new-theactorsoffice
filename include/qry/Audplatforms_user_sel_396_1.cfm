
<cftry>
    <cfset AuditionPlatformUserService = createObject("component", "services.AuditionPlatformUserService")>
    <cfset Audplatforms_user_sel = AuditionPlatformUserService.getUserAudPlatforms(new_userid=new_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Audplatforms_user_sel_396_1.cfm]: #cfcatch.message#">
        <cfset Audplatforms_user_sel = queryNew("ID, NAME", "integer,varchar")>
    </cfcatch>
</cftry>
