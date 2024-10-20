<cfcomponent displayname="AuditionPlatformsUserService" hint="Handles operations for AuditionPlatformsUser table" output="false" > 
<cffunction name="insertaudPlatforms_user" access="public" returntype="numeric">
    <cfargument name="audplatformid" type="numeric" required="true">
    <cfargument name="audplatform" type="string" required="true">
    <cfargument name="isDeleted" type="boolean" required="true" default=false>
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="recordname" type="string" required="false">

    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#application.dsn#" result="queryResult">
            INSERT INTO audPlatforms_user_tbl (audplatformid, audplatform, isDeleted, userid, recordname)
            VALUES (
                <cfqueryparam value="#arguments.audplatformid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.audplatform#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#not structKeyExists(arguments, 'recordname')#">
            )
        </cfquery>
        
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into audPlatforms_user_tbl: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL: INSERT INTO audPlatforms_user_tbl (audplatformid, audplatform, isDeleted, userid, recordname) VALUES (#arguments.audplatformid#, '#arguments.audplatform#', #arguments.isDeleted#, #arguments.userid#, '#arguments.recordname#')">
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>
<!--- Changes made:
- Corrected the default attribute for the 'isDeleted' argument to be outside of the required attribute.
--->

<cffunction name="getaudPlatforms_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="audplatformid">
    
    <cfset var validColumns = "audplatformid,userid,audplatform,recordname,isDeleted">
    <cfset var validOrderColumns = "audplatformid,userid,audplatform,recordname,isDeleted">
    <cfset var sql = "SELECT audplatformid, userid, audplatform, recordname, isDeleted FROM audPlatforms_user_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <cftry>
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

        <!--- Validate ORDER BY column --->
        <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog file="application" text="Error in getaudPlatforms_user: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">

        <!--- Return an empty query with correct schema --->
        <cfset result = queryNew("audplatformid,userid,audplatform,recordname,isDeleted", "integer,integer,varchar,varchar,bit")>
    </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Removed 'de' function call from cfsqltype assignment in the arrayAppend for queryParams.
--->
</cfcomponent>
