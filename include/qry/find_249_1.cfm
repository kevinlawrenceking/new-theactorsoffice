
<cftry>
    <cfset find = createObject("component", "/services/SiteTypeUserService").getsitetypes_user(userid, new_sitetypename)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_249_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
