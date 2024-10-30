
<cftry>
    <cfset upload_details = createObject("component", "services.AuditionImportService").DETauditionsimport(uploadid=#uploadid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in upload_details_140_1.cfm]: #cfcatch.message#" />
        <cfthrow />
    </cfcatch>
</cftry>
