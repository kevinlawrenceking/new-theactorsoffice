
<cftry>
    <cfset findcountry = createObject("component", "services.CountryService").getCountryById(countryid=countryid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findcountry_199_4.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching country data. Please try again later.">
    </cfcatch>
</cftry>
