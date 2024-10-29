
<cftry>
    <cfset siteTypeUserService = createObject("component", "services.SiteTypeUserService")>
    <cfset find = siteTypeUserService.getSiteTypesUser(
        sitetypename = x.sitetypename,
        userid = select_userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_7.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
