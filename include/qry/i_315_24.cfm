
<cftry>
    <cfset contactImportService = new services.ContactImportService()>
    <cfset i = contactImportService.getContactsImport(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in i_315_24.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
