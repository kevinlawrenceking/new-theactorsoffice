
<cftry>
    <cfset contactImportService = new "/services/ContactImportService.cfc"()>
    <cfset tag = contactImportService.getcontactsimport(new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tag_315_14.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
