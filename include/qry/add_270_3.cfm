
<cftry>
    <cfset result = new services.GenderPronounUserService().insertgenderpronouns_users(
        userid = userid,
        isDeleted = 0,
        isCustom = 1,
        genderpronoun = custom,
        genderpronounPlural = custom
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in add_270_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
