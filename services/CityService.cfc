<cfcomponent displayname="CityService" hint="Handles operations for City table" output="false" > 
<cffunction name="getcities" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="id">
    
    <cfset var sql = "SELECT `id`, `countryid`, `regionid`, `cityname`, `region_id` FROM `cities` WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "id,countryid,regionid,cityname,region_id">
    <cfset var validOrderByColumns = "id,countryid,regionid,cityname,region_id">
    <cfset var result = "">

    <!--- Build WHERE clause dynamically based on provided filters --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de("CF_SQL_" & uCase(listGetAt(validColumns, listFindNoCase(validColumns, key))))})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL if there are conditions --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
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
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getcities function: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with correct column names and types --->
            <cfset result = queryNew("id,countryid,regionid,cityname,region_id", "integer,varchar,varchar,varchar,integer")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected the use of the 'de' function to 'createObject' for dynamic SQL type creation.
--->
</cfcomponent>
