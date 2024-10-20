<cfcomponent displayname="UpdateLogService" hint="Handles operations for UpdateLog table" output="false" > 
<cffunction name="insertupdatelog" access="public" returntype="numeric">
    <cfargument name="updateDetails" type="string" required="true">
    <cfargument name="oldValue" type="string" required="true">
    <cfargument name="newValue" type="string" required="true">
    <cfargument name="recordname" type="string" required="true">
    <cfargument name="updatename" type="string" required="true">
    <cfargument name="updateSource" type="string" required="false" default="User">
    <cfargument name="recid" type="numeric" required="true">
    <cfargument name="compID" type="numeric" required="true">
    <cfargument name="userID" type="numeric" required="true">
    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            INSERT INTO updatelog_tbl (
                updateDetails, oldValue, newValue, recordname, updatename, updateSource,
                recid, compID, userID, IsDeleted
            ) VALUES (
                <cfqueryparam value="#arguments.updateDetails#" cfsqltype="CF_SQL_LONGVARCHAR">,
                <cfqueryparam value="#arguments.oldValue#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.newValue#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.updatename#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.updateSource#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.recid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.compID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">,
                0
            )
        </cfquery>
        <cfreturn insertResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="[insertupdatelog] Error: #cfcatch.message# Details: #cfcatch.detail# SQL: #insertQuery.sql#">
            <!--- Return 0 or some error code if needed --->
            <cfreturn 0>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getupdatelog" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="updateTimestamp">
    <cfset var validColumns = "updateID,recid,compID,userID,oldValue,newValue,recordname,updatename,updateSource,IsDeleted,updateTimestamp,updateDetails">
    <cfset var validOrderColumns = "updateID,recid,compID,userID,updateTimestamp">
    <cfset var sql = "SELECT updateID, recid, compID, userID, oldValue, newValue, recordname, updatename, updateSource, IsDeleted, updateTimestamp, updateDetails FROM updatelog_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <cftry>
        <!--- Build the WHERE clause dynamically based on filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
            </cfif>
        </cfloop>

        <!--- Append WHERE clauses if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
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
        <!--- Log the error and return an empty query --->
        <cflog file="application" text="Error in getupdatelog: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
        <cfset result = queryNew("updateID,recid,compID,userID,oldValue,newValue,recordname,updatename,updateSource,IsDeleted,updateTimestamp,updateDetails", "integer,integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,timestamp,text")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction></cfcomponent>
