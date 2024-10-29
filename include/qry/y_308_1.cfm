
<cftry>
    <cfset y = createObject("component", "services.AuditionImportService").getAuditionsImport(
        isfix = isfix,
        recordid = recordid,
        new_uploadid = new_uploadid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in y_308_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching data from auditionsimport.">
    </cfcatch>
</cftry>
