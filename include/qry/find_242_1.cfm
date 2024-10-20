
<cftry>
    <cfset find = createObject("component", "/services/SiteLinkUserService").getsitelinks_user(userid, new_sitename)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_242_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
