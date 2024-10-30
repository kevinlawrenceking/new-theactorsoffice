
<cftry>
    <cfset siteLinkService = createObject("component", "services.SiteLinkUserService")>
    <cfset mylinks = siteLinkService.SELsitelinks_user_23943(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mylinks_159_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
