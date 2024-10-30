
<cftry>
    <cfset siteTypeUserService = createObject("component", "services.SiteTypeUserService")>
    <cfset siteTypeUserService.INSsitetypes_user_24439(
        siteTypeName = x.sitetypename,
        siteTypeDescription = x.sitetypedescription,
        userId = users.userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_318_8.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INSsitetypes_user_24439.">
    </cfcatch>
</cftry>
