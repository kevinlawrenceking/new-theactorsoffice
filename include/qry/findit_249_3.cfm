
<cftry>
    <cfset siteTypeUserService = createObject("component", "services.SiteTypeUserService")>
    <cfset findit = siteTypeUserService.SELsitetypes_user_24146(sitetypeid=new_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit_249_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
