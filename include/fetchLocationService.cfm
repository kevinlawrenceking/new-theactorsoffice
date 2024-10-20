<!--- This ColdFusion page initializes the LocationService and fetches countries and regions for use in the application. --->
<cfset locationService = new "services.LocationService"() />

<!--- Fetch countries (cached) --->
<cfset countries = locationService.getCountries() />

<!--- Fetch regions --->
<cfset regions = locationService.getRegions() />
