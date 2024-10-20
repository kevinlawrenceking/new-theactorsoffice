<cfcomponent displayname="AuditionOpenCallOptionUserService" hint="Handles operations for AuditionOpenCallOptionUser table" output="false" > 
<cffunction name="insertaudopencalloptions_user" access="public" returntype="numeric">
    <cfargument name="opencallid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="opencallname" type="string" required="false" default="">
    <cfargument name="catlist" type="string" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audopencalloptions_user_tbl (opencallid, userid, opencallname, catlist, isDeleted) VALUES (?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            #sql#
            <cfqueryparam value="#arguments.opencallid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.opencallname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.opencallname)#">
            <cfqueryparam value="#arguments.catlist#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.catlist)#">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
        </cfquery>
        <cfset insertResult = result.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into audopencalloptions_user_tbl: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return 0 or another appropriate error code if insertion fails --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- No changes were necessary as the code is syntactically correct.
--->

<cffunction name="getaudopencalloptions_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var validColumns = "opencallid,userid,opencallname,catlist,isDeleted">
    <cfset var validOrderByColumns = "opencallid,userid,opencallname,catlist,isDeleted">
    <cfset var sql = "SELECT opencallid, userid, opencallname, catlist, isDeleted FROM audopencalloptions_user_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=(listFindNoCase("opencallid,userid", key) ? "CF_SQL_INTEGER" : (key eq "isDeleted" ? "CF_SQL_BIT" : "CF_SQL_VARCHAR")), null=isNull(arguments.filters[key])})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause if valid --->
    <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Try to execute the query and handle errors --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#param.null#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getaudopencalloptions_user: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with correct schema --->
            <cfset result = queryNew("opencallid,userid,opencallname,catlist,isDeleted", "integer,integer,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Removed the incorrect `de` function call in `cfsqltype` assignment within the loop.
--->
</cfcomponent>
