

    <cfset informationSchemaService = createObject("component", "services.InformationSchemaTableService")>
    <cfset y = informationSchemaService.SELinformation_schema(tableNamePattern="aud%")>
