
<cftry>
    <cfset err = createObject("component", "/services/AuditionImportErrorService").insertauditionsimport_error(error_msg="Invalid Category")>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in err_308_7.cfm]: #cfcatch.message#. Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
