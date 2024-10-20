
<cftry>
    <cfset err = createObject("component", "services.AuditionImportErrorService").insertauditionsimport_error(error_msg="Duplicate project")>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in err_308_3.cfm]: #cfcatch.message#. Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
