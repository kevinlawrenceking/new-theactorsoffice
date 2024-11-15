<!--- This ColdFusion page retrieves the country information based on the provided country ID. --->

<cfquery name="findcountry">
    <!--- Query to select country ID and name from countries table based on the given country ID. --->
    select countryid, countryname 
    from countries 
    where countryid = '#countryid#'
</cfquery>
