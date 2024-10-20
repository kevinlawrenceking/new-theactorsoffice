<cfcomponent displayname="FUSystemTypeService" hint="Handles operations for FUSystemType table" output="false" > 
<cffunction name="getfusystemtypes" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var result = "">
    <cfset var sql = "SELECT systemType, systemInfo, recordname, IsDeleted FROM fusystemtypes_tbl WHERE IsDeleted = 0">
    <cfset var whereClause = []>
    <cfset var validColumns = "systemType,systemInfo,recordname,IsDeleted">
    <cfset var validOrderColumns = "systemType,systemInfo,recordname">

    <!--- Build the WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause if valid --->
    <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getfusystemtypes: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with the correct schema --->
            <cfset result = queryNew("systemType,systemInfo,recordname,IsDeleted", "varchar,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Corrected the initialization of 'result' from an empty string to an empty query.
--->
</cfcomponent>
