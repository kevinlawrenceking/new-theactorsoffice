
<cftry>
    <cfset countryService = new "/services/CountryService.cfc"()>
    <cfset findcountry = countryService.getcountries(details.valuecountry)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findcountry_261_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
