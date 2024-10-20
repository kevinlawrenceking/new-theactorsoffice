
<cftry>
    <cfset filters = { "ID" = id }>
    <cfset getRecord = createObject("component", "/services/AuditionImportService").getauditionsimport(filters=filters)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in getRecord_132_1.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
