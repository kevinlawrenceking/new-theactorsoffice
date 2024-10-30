
<cftry>
    <cfset objAuditionImportErrorService = createObject("component", "services.AuditionImportErrorService")>
    <cfset objAuditionImportErrorService.INSauditionsimport_error_24358(id=y.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in err_308_7.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
