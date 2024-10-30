
<cftry>
    <cfset find = createObject("component", "services.GenderPronounUserService").SELgenderpronouns_users_24203(userid=userid, custom=custom)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_270_2.cfm]: #cfcatch.message#">
        <cfset find = queryNew("")>
    </cfcatch>
</cftry>
