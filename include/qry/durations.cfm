<!--- Create an instance of the MtgDurationsService component --->
<cfset mtgDurationsService = createObject("component", "services.MtgDurationsService")>

<!--- Call the SELdurations function to fetch all durations --->
<cfset durations = mtgDurationsService.SELdurations()>
