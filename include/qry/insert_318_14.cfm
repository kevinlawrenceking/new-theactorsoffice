
<cftry>
    <cfset genderPronounService = createObject("component", "/services/GenderPronounUserService")>
    <cfset genderPronounService.INSgenderpronouns_users_24445(
        genderpronoun = x.genderpronoun,
        genderpronounplural = x.genderpronounplural,
        userid = users.userid
    )>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in insert_318_14.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
