
<cftry>
    <cfset pronouns = createObject("component", "services.GenderPronounUserService").getgenderpronouns_users(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in pronouns_210_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
