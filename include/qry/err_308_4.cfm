
<cftry>
    <cfset objAuditionImportErrorService = createObject("component", "services.AuditionImportErrorService")>
    <cfset objAuditionImportErrorService.insertAuditionsImportError(id=y.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in err_308_4.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
