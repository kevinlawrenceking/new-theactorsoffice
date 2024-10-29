
<cftry>
    <cfset contactImportService = new services.ContactImportService()>
    <cfset tag = contactImportService.getContactsImport(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tag_315_12.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
