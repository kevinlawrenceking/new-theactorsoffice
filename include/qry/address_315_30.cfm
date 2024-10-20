
<cftry>
    <cfset contactImportService = new "/services/ContactImportService.cfc"()>
    <cfset address = contactImportService.getcontactsimport(new_uploadid)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in address_315_30.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
