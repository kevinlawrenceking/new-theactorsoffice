
<cftry>
    <cfset pronouns = createObject("component", "services.GenderPronounUserService").getGenderPronoun(userid=session.userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in pronouns_456_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
