
<cftry>
    <cfset genderPronounService = createObject("component", "services.GenderPronounUserService")>
    <cfset find = genderPronounService.getGenderPronounsUsers(userid=userid, custom=custom)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_270_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
