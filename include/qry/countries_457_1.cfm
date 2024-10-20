
<cftry>
    <cfset countries = createObject("component", "/services/CountryService").getvm_countries_regions()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in countries_457_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
