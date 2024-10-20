
<cftry>
    <cfset filters = { "id" = recordid, "status" = "Valid" }>
    <cfset x = createObject("component", "services.AuditionImportService").getauditionsimport(filters=filters)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_308_11.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
