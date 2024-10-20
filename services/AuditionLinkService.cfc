<cfcomponent displayname="AuditionLinkService" hint="Handles operations for AuditionLink table" output="false" > 
<cffunction name="insertaudlinks" access="public" returntype="numeric">
    <cfargument name="linkname" type="string" required="true">
    <cfargument name="linkurl" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="audroleid" type="numeric" required="false" default="#JavaCast('null', '')#">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audlinks_tbl (linkname, linkurl, isDeleted, userid, audroleid) VALUES (?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.linkname#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.linkurl#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#false#" cfsqltype="CF_SQL_BIT"> <!--- Default isDeleted to false --->
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.audroleid)#">
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into audlinks_tbl: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return 0 or any other indication of failure --->
            <cfreturn 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Added missing closing tag for cfcatch.
--->

<cffunction name="getaudlinks" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfset var validColumns = "linkid,userid,audroleid,linkname,linkurl,isDeleted">
    <cfset var sql = "SELECT linkid, userid, audroleid, linkname, linkurl, isDeleted FROM audlinks_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Build the WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Add the WHERE clause to the SQL if there are conditions --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and add ORDER BY clause --->
    <cfif arguments.orderBy neq "" and listFindNoCase(validColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch>
            <!--- Log the error details --->
            <cflog file="application" text="Error in getaudlinks: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with correct column names and types --->
            <cfset result = queryNew("linkid,userid,audroleid,linkname,linkurl,isDeleted", "integer,integer,integer,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- No syntax errors found; code is correct as provided.
--->

<cffunction name="updateaudlinks" access="public" returntype="boolean">
    <cfargument name="linkid" type="numeric" required="true">
    <cfargument name="linkname" type="string" required="true">
    <cfargument name="linkurl" type="string" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="audroleid" type="numeric" required="false">

    <cfset var result = false>
    <cfset var sql = "UPDATE audlinks_tbl SET linkname = ?, linkurl = ?, isDeleted = ?, userid = ?, audroleid = ? WHERE linkid = ?">

    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.linkname#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.linkurl#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.audroleid)#">
            <cfqueryparam value="#arguments.linkid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfset result = true>
        
        <cfcatch>
            <cflog file="application" text="Error updating audlinks_tbl: #cfcatch.message# Details: #cfcatch.detail# Query: #sql#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The code is correct as provided.
--->
</cfcomponent>
