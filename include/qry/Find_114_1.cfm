
<cftry>
    <cfset siteTypeUserService = new "/services/SiteTypeUserService.cfc"()>
    <cfset Find = siteTypeUserService.getsitetypes_user(current_sitetypeid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Find_114_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
