
<cftry>
    <cfset result = createObject("component", "/services/SiteTypeUserService").insertsitetypes_user(
        siteTypeName = new_siteTypeName,
        siteTypeDescription = "",
        userid = userid,
        IsDeleted = 0
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in add_sitetype_249_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
