
<cftry>
    <cfset find = createObject("component", "services.SiteTypeUserService").getSiteTypeId(
        sitetypename = x.sitetypename,
        userid = users.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_16.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
