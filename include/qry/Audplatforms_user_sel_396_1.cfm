
<cftry>
    <cfset AuditionPlatformUserService = createObject("component", "services.AuditionPlatformUserService")>
    <cfset Audplatforms_user_sel = AuditionPlatformUserService.SELaudplatforms_user_24582(new_userid=new_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Audplatforms_user_sel_396_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
