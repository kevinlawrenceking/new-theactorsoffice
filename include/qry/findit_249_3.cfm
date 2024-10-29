
<cftry>
    <cfset siteTypeUserService = createObject("component", "services.SiteTypeUserService")>
    <cfset findit = siteTypeUserService.getSiteTypesUserBySitetypeId(sitetypeid=new_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit_249_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
