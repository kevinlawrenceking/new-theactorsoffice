<cfcomponent displayname="ComponentService" hint="Handles operations for Component table" output="false" > 
<cffunction name="getpgcomps" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT compID, appID, menuOrder, compName, compIcon, compDir, compTable, compInner, compRecordName, recordname, service, IsDeleted, compOwner, menuYN, compActive FROM pgcomps_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "compID,appID,menuOrder,compName,compIcon,compDir,compTable,compInner,compRecordName,recordname,service,IsDeleted,compOwner,menuYN,compActive">
    <cfset var validOrderByColumns = "compID,appID,menuOrder">

    <!--- Build the WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions to SQL --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & uCase(listGetAt(validColumns & ',', listFindNoCase(validColumns & ',', key))) )#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getpgcomps: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with matching schema on error --->
            <cfset queryResult = queryNew("compID,appID,menuOrder,compName,compIcon,compDir,compTable,compInner,compRecordName,recordname,service,IsDeleted,compOwner,menuYN,compActive", "integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,binary,char,char")>
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn queryResult>
</cffunction> 

<!--- Changes made:
- Corrected the data types in queryNew to match the expected column types.
--->
</cfcomponent>
