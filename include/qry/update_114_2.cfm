
<cftry>
    <cfset variables.siteTypeService = createObject("component", "/services/SiteTypeUserService")>
    <cfset variables.siteTypeService.updateSiteTypeAsDeleted(sitetypeid=current_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_114_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
