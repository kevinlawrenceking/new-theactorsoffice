
<cftry>
    <cfset pronouns = createObject("component", "services.GenderPronounUserService").SELgenderpronouns_users(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in pronouns_210_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
