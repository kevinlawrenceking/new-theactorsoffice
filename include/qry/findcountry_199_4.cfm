
<cftry>
    <cfset countryService = createObject("component", "services.CountryService")>
    <cfset findcountry = countryService.getcountries(countryid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findcountry_199_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
