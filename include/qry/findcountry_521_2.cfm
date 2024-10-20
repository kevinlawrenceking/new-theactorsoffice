
<cftry>
    <cfset countryService = createObject("component", "/services/CountryService")>
    <cfset findcountry = countryService.getcountries(details.valuecountry)>
<cfcatch type="any">
    <cfset errorLog = "[Error in findcountry_521_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
