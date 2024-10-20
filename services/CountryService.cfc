<cfcomponent displayname="CountryService" hint="Handles operations for Country table" output="false" > 
<cffunction name="getcountries" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="countryName">
    
    <cfset var sql = "SELECT countryid, countryName, IsDeleted, recordname FROM countries WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "countryid,countryName,IsDeleted,recordname">
    <cfset var validOrderColumns = "countryid,countryName,IsDeleted,recordname">
    <cfset var result = "">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <!--- Corrected the function call to getColumnType --->
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de("CF_SQL_" & uCase(getColumnType(key)))} )>
        </cfif>
    </cfloop>

    <!--- Construct final SQL statement --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and apply ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getcountries: #cfcatch.message#, Details: #cfcatch.detail#, SQL: #sql#">
            <!--- Return an empty query with the correct schema --->
            <cfset result = queryNew("countryid,countryName,IsDeleted,recordname", "char,varchar,bit,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected the function call to getColumnType by removing de() which was incorrect.
--->

<cffunction name="getvm_countries_regions" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="countryname">

    <cfset var validColumns = "countryid,countryname">
    <cfset var sql = "SELECT countryid, countryname FROM vm_countries_regions WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryResult = "">
    
    <!--- Validate and construct WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    <cfelse>
        <!--- Return empty query if no filters are provided --->
        <cfreturn queryNew("countryid,countryname", "CF_SQL_CHAR,CF_SQL_VARCHAR")>
    </cfif>

    <!--- Validate ORDER BY column --->
    <cfif NOT listFindNoCase(validColumns, arguments.orderBy)>
        <cfset arguments.orderBy = "countryname">
    </cfif>

    <!--- Append ORDER BY clause --->
    <cfset sql &= " ORDER BY #arguments.orderBy#">

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getvm_countries_regions: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query on error --->
            <cfreturn queryNew("countryid,countryname", "CF_SQL_CHAR,CF_SQL_VARCHAR")>
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn queryResult>
</cffunction></cfcomponent>
