
<cftry>
    <cfset siteTypeUserService = createObject("component", "services.SiteTypeUserService")>
    <cfset Find = siteTypeUserService.getPNIDBySiteTypeID(sitetypeid=current_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Find_114_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching PNID." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
