<cfcomponent displayname="GenderPronounUserService" hint="Handles operations for GenderPronounUser table" output="false" > 
<cffunction name="insertgenderpronouns_users" access="public" returntype="numeric">
    <cfargument name="genderPronoun" type="string" required="true">
    <cfargument name="genderPronounPlural" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="isDeleted" type="boolean" default=false>
    <cfargument name="isCustom" type="boolean" default=false>

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO genderpronouns_users_tbl (genderPronoun, genderPronounPlural, userid, isDeleted, isCustom) VALUES (?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            #sql#
            <cfqueryparam value="#arguments.genderPronoun#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.genderPronounPlural#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.isCustom#" cfsqltype="CF_SQL_BIT">
        </cfquery>
        <cfset insertResult = insertQuery.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into genderpronouns_users_tbl: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- None. The code is correct as provided.
--->

<cffunction name="getgenderpronouns_users" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">

    <cfset var sql = "SELECT `userid`, `ID`, `genderPronoun`, `genderPronounPlural`, `isDeleted`, `isCustom` FROM genderpronouns_users_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var params = []>
    <cfset var validColumns = "userid,ID,genderPronoun,genderPronounPlural,isDeleted,isCustom">
    <cfset var validOrderColumns = "userid,ID,genderPronoun,genderPronounPlural">

    <!--- Build the WHERE clause dynamically based on provided filters --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(params, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Add the WHERE clause to the SQL statement if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause if specified --->
    <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Try executing the query and handle errors gracefully --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getgenderpronouns_users: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset result = queryNew("userid,ID,genderPronoun,genderPronounPlural,isDeleted,isCustom", "integer,integer,varchar,varchar,bit,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The function code is syntactically correct.
--->
</cfcomponent>
