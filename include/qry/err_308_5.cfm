
<cftry>
    <cfset errorService = new "/services/AuditionImportErrorService.cfc"()>
    <cfset err = errorService.insertauditionsimport_error(error_msg="Missing Role name")>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in err_308_5.cfm]: #cfcatch.message#. Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
