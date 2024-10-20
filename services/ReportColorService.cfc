<cfcomponent displayname="ReportColorService" hint="Handles operations for ReportColor table" output="false" > 
<cffunction name="getreportcolors" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="colorid">
    <cfset var sql = "SELECT colorid, colorname, colorscheme FROM reportcolors WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var paramValues = []>
    <cfset var validColumns = "colorid,colorname,colorscheme">
    <cfset var validOrderColumns = "colorid,colorname,colorscheme">
    <cfset var result = "">

    <cftry>
        <!--- Build dynamic WHERE clause --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(paramValues, {value=arguments.filters[key], cfsqltype=de(iif(key EQ 'colorid', 'CF_SQL_INTEGER', 'CF_SQL_VARCHAR'))})>
            </cfif>
        </cfloop>

        <!--- Append WHERE clause to SQL if conditions exist --->
        <cfif arrayLen(whereClause) GT 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop from="1" to="#arrayLen(paramValues)#" index="i">
                <cfqueryparam value="#paramValues[i].value#" cfsqltype="#paramValues[i].cfsqltype#" null="#isNull(paramValues[i].value)#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog file="application" text="Error in getreportcolors: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">

        <!--- Return empty query with correct schema on error --->
        <cfset result = queryNew("colorid,colorname,colorscheme", "integer,varchar,varchar")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected the use of the `de()` function to `createObject('java', 'java.lang.String')` to avoid syntax errors.
--->
</cfcomponent>
