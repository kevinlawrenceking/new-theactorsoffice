<cfcomponent displayname="AuditionImportErrorService" hint="Handles operations for AuditionImportError table" output="false" > 
<cffunction name="insertauditionsimport_error" access="public" returntype="numeric">
    <cfargument name="error_msg" type="string" required="true">
    <cfset var insertResult = 0>
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO auditionsimport_error (error_msg)
            VALUES (
                <cfqueryparam value="#arguments.error_msg#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.error_msg)#">
            )
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        <cfcatch>
            <cflog file="application" type="error" text="Error inserting into auditionsimport_error: #cfcatch.message#. Details: #cfcatch.detail#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>
    <cfreturn insertResult>
</cffunction>
<!--- Changes made:
- None. The function code is syntactically correct.
--->

<cffunction name="getauditionsimport_error" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var sql = "SELECT `id`, `error_msg` FROM auditionsimport_error WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "id,error_msg">
    <cfset var queryResult = "">
    
    <cftry>
        <!--- Build WHERE clause dynamically --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- Append WHERE conditions to SQL --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif len(trim(arguments.orderBy)) and listFindNoCase(validColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#iif(key EQ 'id', 'CF_SQL_INTEGER', 'CF_SQL_VARCHAR')#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error details --->
        <cflog file="application" text="Error in getauditionsimport_error: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

        <!--- Return an empty query with correct schema on error --->
        <cfset queryResult = queryNew("id,error_msg", "integer,varchar")>
    </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction>

<!--- Changes made:
- None. The provided function code is syntactically correct.
--->
</cfcomponent>
