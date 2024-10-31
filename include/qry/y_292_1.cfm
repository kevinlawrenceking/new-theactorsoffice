
<cftry>
    <cfset informationSchemaService = createObject("component", "services.InformationSchemaTableService")>
    <cfset y = informationSchemaService.SELinformation_schema.tables(tableNamePattern="aud%")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in y_292_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
