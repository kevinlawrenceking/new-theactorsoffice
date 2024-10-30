
<cftry>
    <cfset pronouns = createObject("component", "services.GenderPronounUserService").SELgenderpronouns_users_24627(userid=session.userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in pronouns_456_4.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
