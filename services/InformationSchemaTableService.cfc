<cfcomponent displayname="InformationSchemaTableService" hint="Handles operations for InformationSchemaTable table" output="false" > 
<cffunction name="getInformationSchemaTables" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var sql = "SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE FROM information_schema.tables WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "TABLE_CATALOG,TABLE_SCHEMA,TABLE_NAME,TABLE_TYPE">
    <cfset var validOrderByColumns = "TABLE_CATALOG,TABLE_SCHEMA,TABLE_NAME,TABLE_TYPE">
    <cfset var queryResult = "">

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Handle ORDER BY clause --->
    <cfif arguments.orderBy neq "" and listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <!--- Bind parameters --->
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch>
            <!--- Log the error details --->
            <cflog file="application" text="Error executing getInformationSchemaTables: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with the correct schema --->
            <cfset queryResult = queryNew("TABLE_CATALOG,TABLE_SCHEMA,TABLE_NAME,TABLE_TYPE", "varchar,varchar,varchar,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction>

<!--- Changes made:
- Corrected function name to follow standard naming conventions (removed invalid characters).
--->
</cfcomponent>
