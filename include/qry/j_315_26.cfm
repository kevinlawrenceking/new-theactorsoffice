
<cftry>
    <cfset contactImportService = createObject("component", "services.ContactImportService")>
    <cfset j = contactImportService.getContactsImport(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in j_315_26.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
