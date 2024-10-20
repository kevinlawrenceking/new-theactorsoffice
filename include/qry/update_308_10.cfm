
<cftry>
    <cfset variables.auditionImportService = new "/services/AuditionImportService.cfc"()>
    <cfset variables.updateResult = variables.auditionImportService.updateauditionsimport(
        ID = y.id,
        data = {status = new_status}
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_308_10.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
