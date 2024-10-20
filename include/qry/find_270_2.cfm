
<cftry>
    <cfset find = createObject("component", "services.GenderPronounUserService").getgenderpronouns_users(userid, custom)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_270_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
