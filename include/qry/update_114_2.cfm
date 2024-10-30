
<cftry>
    <cfset variables.siteTypeUserService = createObject("component", "/services/SiteTypeUserService")>
    <cfset variables.siteTypeUserService.UPDsitetypes_user(sitetypeid=current_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_114_2.cfm]: #cfcatch.message#">
        <cfthrow message="Error in update_114_2.cfm" detail="#cfcatch.message#">
    </cfcatch>
</cftry>
