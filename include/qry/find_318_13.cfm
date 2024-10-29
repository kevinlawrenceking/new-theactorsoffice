
<cftry>
    <cfset find = createObject("component", "services.GenderPronounUserService").getUserByGenderPronoun(
        genderpronoun = x.genderpronoun,
        userid = users.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_13.cfm]: #cfcatch.message#">
        <cfset find = queryNew("")>
    </cfcatch>
</cftry>
