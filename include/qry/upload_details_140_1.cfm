
<cftry>
    <cfset upload_details = createObject("component", "services.AuditionImportService").getauditionsimport({
        uploadid = uploadid,
        status = "Added"
    })>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in upload_details_140_1.cfm] #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
