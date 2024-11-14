<!--- Create an instance of the MtgDurationService component --->
<cfset mtgDurationService = createObject("component", "services.MtgDurationService")>

<!--- Call the SELdurations function to fetch all durations --->
<cfset durations = mtgDurationService.SELdurations()>
