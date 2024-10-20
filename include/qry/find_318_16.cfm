
<cftry>
    <cfset find = createObject("component", "services.SiteTypeUserService").getsitetypes_user(x.sitetypename, users.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_318_16.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
