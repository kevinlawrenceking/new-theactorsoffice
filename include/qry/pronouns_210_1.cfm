
<cftry>
    <cfset pronounsService = createObject("component", "services.GenderPronounUserService")>
    <cfset pronouns = pronounsService.getGenderPronoun(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in pronouns_210_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
