<cfcomponent displayname="IncomeTypeService" hint="Handles operations for IncomeType table" output="false" > 
<cffunction name="getincometypes" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">

    <cfset var sql = "SELECT incometypeid, incometype FROM incometypes WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "incometypeid,incometype">
    <cfset var validOrderByColumns = "incometypeid,incometype">
    <cfset var result = "">

    <cftry>
        <!--- Build dynamic WHERE clause --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=key EQ 'incometypeid' ? 'CF_SQL_INTEGER' : 'CF_SQL_VARCHAR'})>
            </cfif>
        </cfloop>

        <!--- Append WHERE clause to SQL if there are conditions --->
        <cfif arrayLen(whereClause) GT 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif len(arguments.orderBy) AND listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

    <cfcatch>
        <!--- Log error and return empty query --->
        <cflog file="application" type="error" text="Error in getincometypes: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
        <cfset result = queryNew("incometypeid,incometype", "integer,varchar")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The provided code is syntactically correct.
--->
</cfcomponent>
