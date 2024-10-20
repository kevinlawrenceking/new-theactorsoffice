
<cftry>
    <cfset filters = { id = results.id }>
    <cfset orderBy = "" >
    
    <cfset errs = createObject("component", "services.AuditionImportErrorService").getauditionsimport_error(filters=filters, orderBy=orderBy)>
    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in errs_125_2.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
