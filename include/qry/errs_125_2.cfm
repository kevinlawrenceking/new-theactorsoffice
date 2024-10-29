
<cftry>
    <cfset errs = createObject("component", "services.AuditionImportErrorService").getErrorMessageById(id=results.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in errs_125_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
