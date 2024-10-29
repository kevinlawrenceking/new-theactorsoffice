
<cftry>
    <cfset siteLinkService = createObject("component", "services.SiteLinkUserService")>
    <cfset mylinks = siteLinkService.getSiteLinksByUser(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mylinks_159_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
