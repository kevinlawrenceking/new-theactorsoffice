
<cftry>
    <cfset upload_details = createObject("component", "services.ContactImportService").getcontactsimport(uploadid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in upload_details_141_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
