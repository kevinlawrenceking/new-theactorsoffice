
<cftry>
    <cfset genderPronounService = createObject("component", "services.GenderPronounUserService")>
    <cfset genderPronounService.insertGenderPronounsUser(userid=userid, custom=custom)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in add_270_3.cfm]: #cfcatch.message#">
    <cfthrow>
</cfcatch>
</cftry>
