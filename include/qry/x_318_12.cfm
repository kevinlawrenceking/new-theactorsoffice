
<cftry>
    <cfset genderPronounService = createObject("component", "services.GenderPronounService")>
    <cfset x = genderPronounService.getGenderPronouns()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_318_12.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
