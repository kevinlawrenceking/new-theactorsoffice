
<cftry>
    <cfset siteTypeUserService = createObject("component", "services.SiteTypeUserService")>
    <cfset siteTypeUserService.updateSiteTypesUser(new_pnid=new_pnid, new_sitetypeid=new_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_249_6.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the sitetypes_user table." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
