
<cftry>
    <cfset siteTypeUserService = new services.SiteTypeUserService()>
    <cfset Find = siteTypeUserService.SELsitetypes_user(sitetypeid=current_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Find_114_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving PNID by SiteTypeID." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
