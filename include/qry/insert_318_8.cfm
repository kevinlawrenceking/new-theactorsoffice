
<cftry>
    <cfset siteTypeUserService = createObject("component", "/services/SiteTypeUserService")>
    <cfset siteTypeUserService.insertSiteTypeUser(
        siteTypeName = x.sitetypename,
        siteTypeDescription = x.sitetypedescription,
        userId = users.userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_318_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
