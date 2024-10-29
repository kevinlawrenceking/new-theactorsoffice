
<cftry>
    <cfset genderPronounService = new "/services/GenderPronounUserService.cfc"()>
    <cfset genderPronounService.insertGenderPronounsUser(
        genderpronoun = x.genderpronoun, 
        genderpronounplural = x.genderpronounplural, 
        userid = users.userid
    )>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in insert_318_14.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
