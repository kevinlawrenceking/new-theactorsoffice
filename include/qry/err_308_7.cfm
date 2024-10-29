
<cftry>
    <cfset errorService = new "/services/AuditionImportErrorService.cfc"()>
    <cfset errorService.insertAuditionsImportError(id=y.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in err_308_7.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
