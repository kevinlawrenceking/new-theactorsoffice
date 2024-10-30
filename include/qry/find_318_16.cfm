
<cftry>
    <cfset siteTypeUserService = createObject("component", "services.SiteTypeUserService")>
    <cfset find = siteTypeUserService.SELsitetypes_user_24447(
        sitetypename = x.sitetypename,
        userid = users.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_16.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
