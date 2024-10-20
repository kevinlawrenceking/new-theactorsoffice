
<cftry>
    <cfset contactImportService = new "/services/ContactImportService.cfc"()>
    <cfset f = contactImportService.getcontactsimport(new_uploadid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in f_315_18.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
