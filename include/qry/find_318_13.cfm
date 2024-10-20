
<cftry>
    <cfset find = createObject("component", "/services/GenderPronounUserService").getgenderpronouns_users(
        genderpronoun = x.genderpronoun,
        userid = users.userid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_318_13.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
