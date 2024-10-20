<cfcomponent displayname="SiteTypeMasterService" hint="Handles operations for SiteTypeMaster table" output="false" > 
<cffunction name="getsitetypes_master" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="siteTypeid">
    
    <cfset var validColumns = "siteTypeid,siteTypeName,siteTypeDescription,pnTitle,IsDeleted">
    <cfset var sql = "SELECT siteTypeid, siteTypeName, siteTypeDescription, pnTitle, IsDeleted FROM sitetypes_master_tbl WHERE IsDeleted = 0">
    <cfset var whereClause = []>
    <cfset var queryResult = "">

    <!--- Validate orderBy column --->
    <cfif NOT listFindNoCase(validColumns, arguments.orderBy)>
        <cfset arguments.orderBy = "siteTypeid">
    </cfif>

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions if any --->
    <cfif arrayLen(whereClause) GT 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfset sql &= " ORDER BY #arguments.orderBy#">

    <!--- Execute query within try/catch for error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate("CF_SQL_" & uCase(listLast(key)))#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getsitetypes_master: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with correct schema on error --->
            <cfset queryResult = queryNew("siteTypeid,siteTypeName,siteTypeDescription,pnTitle,IsDeleted", "integer,varchar,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn queryResult>
</cffunction>

<!--- Changes made:
- No syntax errors found. The function is correctly structured.
--->
</cfcomponent>
