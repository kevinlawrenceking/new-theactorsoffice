
<cftry>
    <cfset filters = structNew()>
    <cfset filters.uploadid = uploadid>

    <cfset results = createObject("component", "services.AuditionImportService").getauditionsimport(filters=filters)>
    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in results_140_2.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
