
<cftry>
    <cfset find = createObject("component", "services.SiteTypeUserService").getsitetypes_user(x.sitetypename, select_userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_318_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
