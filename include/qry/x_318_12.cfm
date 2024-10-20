
<cftry>
    <cfset genderPronounService = new services.GenderPronounService()>
    <cfset x = genderPronounService.getgenderpronouns()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_318_12.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
