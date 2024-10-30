
<cftry>
    <cfset find = createObject("component", "services.GenderPronounUserService").SELgenderpronouns_users_24444(
        genderpronoun = x.genderpronoun,
        userid = users.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_13.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
