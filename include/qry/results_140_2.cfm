
<cftry>
    <cfset results = createObject("component", "services.AuditionImportService").getAuditionImportData(uploadid=uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_140_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
