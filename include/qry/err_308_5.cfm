
<cftry>
    <cfset errorService = createObject("component", "services.AuditionImportErrorService")>
    <cfset errorService.INSauditionsimport_error_24356(id=y.id)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in err_308_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
