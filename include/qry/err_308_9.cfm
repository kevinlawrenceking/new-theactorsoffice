
<cftry>
    <cfset componentPath = "/services/AuditionImportErrorService.cfc">
    <cfset componentInstance = createObject("component", componentPath)>
    <cfset componentInstance.INSauditionsimport_error_24360(id=y.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in err_308_9.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
