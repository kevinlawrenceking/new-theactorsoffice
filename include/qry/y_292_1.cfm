
<cftry>
    <cfset y = createObject("component", "/services/InformationSchemaTableService").getinformation_schema_tables({tableNamePattern="aud%"})>
    <cfcatch type="any">
        <cfset errorLog = "[Error in y_292_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
