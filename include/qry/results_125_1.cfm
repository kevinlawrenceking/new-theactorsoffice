
<cftry>
    <cfset results = createObject("component", "services.AuditionImportService").RESauditionsimport(id=url.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_125_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
