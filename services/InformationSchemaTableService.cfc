<cfcomponent displayname="InformationSchemaTableService" hint="Handles operations for InformationSchemaTable table" 
output="false"> 
<cffunction name="SELinformation_schema" access="public" returntype="query">
    <cfargument name="tableNamePattern" type="string" required="true">
    <cfset var result = "">

    <cfquery name="result">
        SELECT table_name AS new_comptable
        FROM information_schema.tables
        WHERE TABLE_NAME LIKE <cfqueryparam value="#arguments.tableNamePattern#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>

    <cfreturn result>
</cffunction>
</cfcomponent>