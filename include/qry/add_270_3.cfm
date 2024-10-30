
<cftry>
    <cfset objGenderPronounUserService = createObject("component", "services.GenderPronounUserService")>
    <cfset objGenderPronounUserService.INSgenderpronouns_users(userid=userid, custom=custom)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_270_3.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
