
<cftry>
    <cfset findcountry = createObject("component", "services.CountryService").SELcountries(countryid=countryid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findcountry_199_4.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching country information. Please try again later.">
    </cfcatch>
</cftry>
