
<cftry>
    <cfset x = createObject("component", "services.GenderPronounService").SELgenderpronouns()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_318_12.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
