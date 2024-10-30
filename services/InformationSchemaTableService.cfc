<cfcomponent displayname="InformationSchemaTableService" hint="Handles operations for InformationSchemaTable table" output="false"> 
<cffunction name="SELinformation_schema.tables" access="public" returntype="query">
    <cfargument name="tableNamePattern" type="string" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT table_name AS new_comptable
            FROM information_schema.tables
            WHERE TABLE_NAME LIKE <cfqueryparam value="#arguments.tableNamePattern#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error executing getAuditTables: #cfcatch.message#">
            <cfreturn queryNew("new_comptable")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
