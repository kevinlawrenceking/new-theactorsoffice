
<!--- This ColdFusion page handles the insertion of error messages into the auditionsimport_error table. --->

<cftry>
    <cfset objAuditionImportErrorService = createObject("component", "services.AuditionImportErrorService")>
    <cfset objAuditionImportErrorService.insertAuditionImportError(id=y.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in err_308_9.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
