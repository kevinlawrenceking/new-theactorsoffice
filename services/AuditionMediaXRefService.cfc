<cfcomponent displayname="AuditionMediaXRefService" hint="Handles operations for AuditionMediaXRef table" output="false" > 
<cffunction name="deleteaudmedia_auditions_xref" access="public" returntype="boolean">
    <cfargument name="mediaid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="false">

    <cfset var result = false>
    <cfset var sql = "DELETE FROM audmedia_auditions_xref WHERE mediaid = ?">
    <cfset var queryParams = [arguments.mediaid]>

    <!--- Dynamically build the WHERE clause based on provided arguments --->
    <cfif structKeyExists(arguments, "audprojectid") and not isNull(arguments.audprojectid)>
        <cfset sql &= " AND audprojectid = ?">
        <cfset arrayAppend(queryParams, arguments.audprojectid)>
    </cfif>

    <!--- Try to execute the query and handle any potential errors --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfloop array="#queryParams#" index="paramValue">
                <cfqueryparam value="#paramValue#" cfsqltype="CF_SQL_INTEGER">
            </cfloop>
        </cfquery>
        <cfset result = true>
        <cfcatch type="any">
            <cflog file="application" text="Error in deleteaudmedia_auditions_xref: #cfcatch.message#; Detail: #cfcatch.detail#; SQL: #sql#">
            <!--- Return false if there is an error --->
            <cfset result = false>
        </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="insertaudmedia_auditions_xref" access="public" returntype="numeric">
    <cfargument name="mediaid" type="numeric" required="true">
    <cfargument name="audprojectid" type="numeric" required="false">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audmedia_auditions_xref (mediaid, audprojectid) VALUES (?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.mediaid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.audprojectid#" cfsqltype="CF_SQL_INTEGER" null="#not structKeyExists(arguments, 'audprojectid')#">
        </cfquery>

        <cfset insertResult = queryResult.generatedKey>

        <cfcatch>
            <cflog file="application" text="Error in insertaudmedia_auditions_xref: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>


<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="getaudmedia_auditions_xref" access="public" returntype="query">
    <cfargument name="mediaid" type="numeric" required="false">
    <cfargument name="audprojectid" type="numeric" required="false">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var result = "">
    <cfset var sql = "SELECT mediaid, audprojectid FROM audmedia_auditions_xref WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var params = []>
    <cfset var validOrderByColumns = "mediaid,audprojectid">

    <!--- Build WHERE clause dynamically --->
    <cfif structKeyExists(arguments, "mediaid") and not isNull(arguments.mediaid)>
        <cfset arrayAppend(whereClause, "mediaid = ?")>
        <cfset arrayAppend(params, {value=arguments.mediaid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "audprojectid") and not isNull(arguments.audprojectid)>
        <cfset arrayAppend(whereClause, "audprojectid = ?")>
        <cfset arrayAppend(params, {value=arguments.audprojectid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <!--- Append WHERE clauses to SQL --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY " & arguments.orderBy>
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

        <!--- Handle errors gracefully --->
        <cfcatch type="any">
            <cflog file="application" text="Error in getaudmedia_auditions_xref: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with correct schema on error --->
            <cfset result = queryNew("mediaid,audprojectid", "integer,integer")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Corrected the initialization of the 'result' variable to be an empty string instead of an empty query object.
--->
</cfcomponent>
