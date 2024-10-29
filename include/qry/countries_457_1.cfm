
<cftry>
    <cfset countryService = createObject("component", "/services/CountryService")>
    <cfset countries = countryService.getCountries(countryIds=[])>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in countries_457_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching countries." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
