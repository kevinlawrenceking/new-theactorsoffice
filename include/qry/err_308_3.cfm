
<cftry>
    <cfset errorService = createObject("component", "services.AuditionImportErrorService")>
    <cfset errorService.insertAuditionsImportError(id=y.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in err_308_3.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while calling the insert function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
