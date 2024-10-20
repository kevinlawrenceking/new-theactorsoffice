
<cftry>
    <cfset err = createObject("component", "/services/AuditionImportErrorService").insertauditionsimport_error(
        error_msg = "Missing project name"
    )>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in err_308_4.cfm]: #cfcatch.message#. Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
