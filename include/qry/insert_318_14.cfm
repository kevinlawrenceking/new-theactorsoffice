
<cftry>
    <cfset genderPronounService = new "/services/GenderPronounUserService.cfc"()>
    <cfset genderPronounService.insertgenderpronouns_users(
        genderpronoun = x.genderpronoun, 
        genderpronounplural = x.genderpronounplural, 
        userid = users.userid
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_318_14.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
