
<cftry>
    <cfset siteTypeUserService = createObject("component", "services.SiteTypeUserService")>
    <cfset siteTypeUserService.updateSiteTypeName(new_sitetypename=new_sitetypename, new_sitetypeid=new_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_240_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the site type name." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
