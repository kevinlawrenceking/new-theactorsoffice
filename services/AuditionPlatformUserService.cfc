<cfcomponent displayname="AuditionPlatformUserService" hint="Handles operations for AuditionPlatformUser table" output="false" > 
<cffunction name="insertaudPlatforms_user" access="public" returntype="numeric">
    <cfargument name="audplatformid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="audplatform" type="string" required="true">
    <cfargument name="recordname" type="string" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audPlatforms_user_tbl (audplatformid, userid, audplatform, recordname, isDeleted) VALUES (?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.audplatformid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.audplatform#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into audPlatforms_user_tbl: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return 0 or handle the error appropriately --->
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction> 
<!--- Changes made:
- No changes were necessary as the code is syntactically correct.
--->

<cffunction name="getaudPlatforms_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var sql = "SELECT `audplatformid`, `userid`, `audplatform`, `recordname`, `isDeleted` FROM `audPlatforms_user_tbl` WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "audplatformid,userid,audplatform,recordname,isDeleted">
    <cfset var validOrderByColumns = "audplatformid,userid,audplatform,recordname,isDeleted">
    <cfset var result = "">

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Handle ORDER BY clause --->
    <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch>
            <!--- Log the error details --->
            <cflog file="application" text="Error in getaudPlatforms_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with correct schema on error --->
            <cfset result = queryNew("audplatformid,userid,audplatform,recordname,isDeleted", "integer,integer,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- No changes were necessary as the code is syntactically correct.
--->
</cfcomponent>
