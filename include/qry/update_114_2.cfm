
<cftry>
    <cfset siteTypeUserService = new "/services/SiteTypeUserService.cfc"()>
    <cfset siteTypeUserService.updatesitetypes_user(current_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_114_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
