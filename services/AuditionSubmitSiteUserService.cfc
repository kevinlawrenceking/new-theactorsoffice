<cfcomponent displayname="AuditionSubmitSiteUserService" hint="Handles operations for AuditionSubmitSiteUser table" output="false" > 
<cffunction name="insertaudsubmitsites_user" access="public" returntype="numeric">
    <cfargument name="submitsiteid" type="numeric" required="true">
    <cfargument name="submitsiteName" type="string" required="false" default="">
    <cfargument name="userid" type="numeric" required="false" default="">
    <cfargument name="catlist" type="string" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audsubmitsites_user_tbl (submitsiteid, submitsiteName, userid, catlist, isDeleted) VALUES (?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.submitsiteid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.submitsiteName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.submitsiteName)#">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.userid)#">
            <cfqueryparam value="#arguments.catlist#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.catlist)#">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        <cfcatch>
            <cflog text="Error in insertaudsubmitsites_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#" type="error">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- None. The provided code does not contain syntax errors that would prevent execution.
--->

<cffunction name="getaudsubmitsites_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="submitsiteid">
    
    <cfset var validColumns = "submitsiteid,userid,submitsiteName,catlist,isDeleted">
    <cfset var validOrderColumns = "submitsiteid,userid,submitsiteName,catlist,isDeleted">
    <cfset var sql = "SELECT submitsiteid, userid, submitsiteName, catlist, isDeleted FROM audsubmitsites_user_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <cftry>
        <!--- Build dynamic WHERE clause --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de(iif(key == 'isDeleted', 'CF_SQL_BIT', iif(key == 'userid' or key == 'submitsiteid', 'CF_SQL_INTEGER', 'CF_SQL_VARCHAR'))), null=iif(isNull(arguments.filters[key]), true, false)})>
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
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#param.null#">
            </cfloop>
        </cfquery>

        <!--- Return the result --->
        <cfreturn result>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getaudsubmitsites_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

        <!--- Return an empty query with correct schema on error --->
        <cfreturn queryNew("submitsiteid,userid,submitsiteName,catlist,isDeleted", "integer,integer,varchar,varchar,bit")>
    </cfcatch>
    </cftry>
</cffunction>

<!--- Changes made:
- No syntax errors found. Code is correct as provided.
--->

<cffunction name="updateaudsubmitsites_user" access="public" returntype="boolean">
    <cfargument name="submitsiteid" type="numeric" required="true">
    <cfargument name="submitsiteName" type="string" required="false" default="">
    <cfargument name="userid" type="numeric" required="false" default="">
    <cfargument name="catlist" type="string" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false" default="">
    
    <cfset var sql = "UPDATE audsubmitsites_user_tbl SET">
    <cfset var setClauses = []>
    <cfset var result = false>

    <!--- Build the SET clause dynamically --->
    <cfif len(trim(arguments.submitsiteName))>
        <cfset arrayAppend(setClauses, "submitsiteName = ?")>
    </cfif>
    <cfif isNumeric(arguments.userid)>
        <cfset arrayAppend(setClauses, "userid = ?")>
    </cfif>
    <cfif len(trim(arguments.catlist))>
        <cfset arrayAppend(setClauses, "catlist = ?")>
    </cfif>
    <cfif isBoolean(arguments.isDeleted)>
        <cfset arrayAppend(setClauses, "isDeleted = ?")>
    </cfif>

    <!--- If there are no fields to update, return false --->
    <cfif arrayLen(setClauses) EQ 0>
        <cfreturn result>
    </cfif>

    <!--- Complete the SQL statement --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE submitsiteid = ?">

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfif len(trim(arguments.submitsiteName))>
                <cfqueryparam value="#arguments.submitsiteName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.submitsiteName)#">
            </cfif>
            <cfif isNumeric(arguments.userid)>
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.userid)#">
            </cfif>
            <cfif len(trim(arguments.catlist))>
                <cfqueryparam value="#arguments.catlist#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.catlist)#">
            </cfif>
            <cfif isBoolean(arguments.isDeleted)>
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT" null="#isNull(arguments.isDeleted)#">
            </cfif>
            <!--- submitsiteid is always required and not nullable --->
            <cfqueryparam value="#arguments.submitsiteid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If the query executes without error, set result to true --->
        <cfset result = true>

        <!--- Error handling and logging --->
        <cfcatch type="any">
            <cflog file="application" text="Error updating audsubmitsites_user_tbl: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        </cfcatch>
    </cftry>

    <!--- Return the result of the update operation --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- None. The code was syntactically correct.
--->
</cfcomponent>
