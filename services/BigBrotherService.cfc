<cfcomponent displayname="BigBrotherService" hint="Handles operations for BigBrother table" output="false" > 
<cffunction name="insertbigbrother" access="public" returntype="numeric">
    <cfargument name="pgid" type="numeric" required="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="remote_addr" type="string" required="false">
    <cfargument name="query_string" type="string" required="false">
    <cfargument name="remote_host" type="string" required="false">
    <cfargument name="script_name" type="string" required="false">
    <cfargument name="contactid" type="numeric" required="false">
    <cfargument name="isInclude" type="string" required="false" default="N">

    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            INSERT INTO bigbrother (
                pgid, userid, remote_addr, query_string, 
                remote_host, script_name, contactid, isInclude
            ) VALUES (
                <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.pgid)#">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.remote_addr#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.remote_addr)#">,
                <cfqueryparam value="#arguments.query_string#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.query_string)#">,
                <cfqueryparam value="#arguments.remote_host#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.remote_host)#">,
                <cfqueryparam value="#arguments.script_name#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.script_name)#">,
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.contactid)#">,
                <cfqueryparam value="#arguments.isInclude#" cfsqltype="CF_SQL_CHAR">
            )
        </cfquery>
        
        <cfset insertResult = result.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into bigbrother: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL: INSERT INTO bigbrother (pgid, userid, remote_addr, query_string, remote_host, script_name, contactid, isInclude) VALUES (?, ?, ?, ?, ?, ?, ?, ?)">
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction> 

<!--- Changes made:
- No syntax errors found; code is correct as provided.
--->

<cffunction name="getbigbrother" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="id">
    <cfset var sql = "SELECT id, pgid, userid, contactid, remote_addr, query_string, remote_host, script_name, timestamp, isInclude FROM bigbrother WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "id,pgid,userid,contactid,remote_addr,query_string,remote_host,script_name,timestamp,isInclude">
    <cfset var validOrderByColumns = "id,timestamp">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    <cfelse>
        <!--- Return empty query if no filters are provided --->
        <cfreturn queryNew("id,pgid,userid,contactid,remote_addr,query_string,remote_host,script_name,timestamp,isInclude", "integer,integer,integer,varchar,varchar,varchar,varchar,timestamp,char")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfreturn result>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getbigbrother: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query on error --->
            <cfreturn queryNew("id,pgid,userid,contactid,remote_addr,query_string,remote_host,script_name,timestamp,isInclude", "integer,integer,integer,varchar,varchar,varchar,varchar,timestamp,char")>
        </cfcatch>
    </cftry>
</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct.
--->
</cfcomponent>
