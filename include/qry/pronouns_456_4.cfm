
<cftry>
    <cfset pronouns = createObject("component", "services.GenderPronounUserService").getgenderpronouns_users(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in pronouns_456_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
