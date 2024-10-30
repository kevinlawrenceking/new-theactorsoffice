
<cftry>
    <cfset componentPath = "/services/AuditionImportErrorService.cfc">
    <cfset objAuditionImportErrorService = createObject("component", componentPath)>
    <cfset objAuditionImportErrorService.INSauditionsimport_error(id=y.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in err_308_3.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while calling INSauditionsimport_error." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
