<cfcomponent displayname="UploadService" hint="Handles operations for Upload table" output="false" > 
<cffunction name="insertuploads" access="public" returntype="numeric">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="uploadstatus" type="string" required="true">
    <cfargument name="IsDeleted" type="boolean" required="true">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO uploads_tbl (userid, uploadstatus, IsDeleted) VALUES (?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.uploadstatus#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into uploads_tbl: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>
<cffunction name="getuploads" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="uploadid">
    <cfset var validColumns = "uploadid,userid,uploadstatus,IsDeleted,timestamp">
    <cfset var orderByWhitelist = "uploadid,userid,timestamp">
    <cfset var sql = "SELECT `uploadid`, `userid`, `uploadstatus`, `IsDeleted`, `timestamp` FROM uploads_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryResult = "">
    
    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(orderByWhitelist, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    <cfelse>
        <cfset sql &= " ORDER BY uploadid">
    </cfif>

    <!--- Try to execute the query and handle errors --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & ucase(listGetAt(validColumns, listFindNoCase(validColumns, key))))#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getuploads: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with correct schema --->
            <cfset queryResult = queryNew("uploadid,userid,uploadstatus,IsDeleted,timestamp", "integer,integer,varchar,bit,timestamp")>
        </cfcatch>
    </cftry>

    <!--- Return the result set --->
    <cfreturn queryResult>
</cffunction></cfcomponent>
