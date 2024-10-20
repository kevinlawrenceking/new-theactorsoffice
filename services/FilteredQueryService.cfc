<cfcomponent displayname="FilteredQueryService" hint="Handles operations for FilteredQuery table" output="false" > 
<cffunction name="getqFiltered" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var sql = "SELECT * FROM qFiltered WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = ""> <!-- Add valid column names here -->
    <cfset var validOrderColumns = ""> <!-- Add valid order by column names here -->
    <cfset var queryResult = "">
    
    <cftry>
        <!-- Build WHERE clause dynamically -->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!-- Append WHERE clause to SQL if any conditions exist -->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!-- Validate and append ORDER BY clause -->
        <cfif len(arguments.orderBy) and listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!-- Execute the query -->
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#"> <!-- Adjust cfsqltype as per schema -->
                </cfif>
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!-- Log error details -->
        <cflog file="application" text="Error in getqFiltered: #cfcatch.message#, Detail: #cfcatch.detail#, SQL: #sql#">

        <!-- Return an empty query with the correct structure on error -->
        <cfset queryResult = queryNew("column1,column2", "CF_SQL_VARCHAR,CF_SQL_INTEGER")> <!-- Adjust columns and types as per schema -->
    </cfcatch>
    </cftry>

    <!-- Return the query result -->
    <cfreturn queryResult>
</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct.
--->
</cfcomponent>
