
<cftry>
    <cfset errorService = createObject("component", "services.AuditionImportErrorService")>
    <cfset errorService.INSauditionsimport_error_24355(id=y.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in err_308_4.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
