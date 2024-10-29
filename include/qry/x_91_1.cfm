
<cftry>
    <cfset siteLinkService = createObject("component", "services.SiteLinkUserService")>
    <cfset x = siteLinkService.getCustomSiteLinks(siteIcon="unknown.png")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_91_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
