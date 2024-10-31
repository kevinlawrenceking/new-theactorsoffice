
<cftry>
    <cfset siteLinksService = createObject("component", "services.SiteLinksMasterService")>
    <cfset x = siteLinksService.SELsitelinks_master()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_318_15.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
