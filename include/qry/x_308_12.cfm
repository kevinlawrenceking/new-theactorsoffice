
<cftry>
    <cfset filters = { uploadid = new_uploadid, status = 'Valid' }>
    <cfset x = createObject("component", "services.AuditionImportService").getauditionsimport(filters=filters)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_308_12.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
