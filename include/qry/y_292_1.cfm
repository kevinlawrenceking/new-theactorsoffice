
<cftry>
    <cfset y = createObject("component", "/services/InformationSchemaTableService").getAuditTables("aud%")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in y_292_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
