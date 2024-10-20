
<cftry>
    <cfset filters = { id = url.id }>
    <cfset results = createObject("component", "services.AuditionImportService").getauditionsimport(filters=filters)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_125_1.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
