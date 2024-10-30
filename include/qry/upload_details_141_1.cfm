
<cftry>
    <cfset upload_details = createObject("component", "services.ContactImportService").DETcontactsimport(uploadid=uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in upload_details_141_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
