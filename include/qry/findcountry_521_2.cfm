
<cftry>
    <cfset findcountry = createObject("component", "services.CountryService").getCountriesByCountryName(details.valuecountry)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findcountry_521_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
