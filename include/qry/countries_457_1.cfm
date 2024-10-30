
<cftry>
    <cfset countryService = createObject("component", "services.CountryService")>
    <cfset countries = countryService.SELcountries_24637(countryIds=[])>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in countries_457_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving countries." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
