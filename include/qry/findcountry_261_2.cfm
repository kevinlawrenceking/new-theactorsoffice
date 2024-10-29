
<cftry>
    <cfset findcountry = createObject("component", "services.CountryService").getCountriesByCountryName(details.valuecountry)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findcountry_261_2.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching country data" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
