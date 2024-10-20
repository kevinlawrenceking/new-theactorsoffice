<cfcomponent displayname="PanelsMasterService" hint="Handles operations for PanelsMaster table" output="false" > 
<cffunction name="getpgpanels_master" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="pnID">
    
    <cfset var validColumns = "pnID,pnOrderNo,pnColXl,pnColMd,pnTitle,pnFilename,pnDescription,IsDeleted">
    <cfset var validOrderColumns = "pnID,pnOrderNo,pnColXl,pnColMd">
    <cfset var sql = "SELECT pnID, pnOrderNo, pnColXl, pnColMd, pnTitle, pnFilename, pnDescription, IsDeleted FROM pgpanels_master_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de("CF_SQL_" & uCase(listGetAt(validColumns, listFindNoCase(validColumns, key))))})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch>
            <!--- Log the error details --->
            <cflog file="application" type="error" text="Error in getpgpanels_master: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            
            <!--- Return an empty query with the correct columns --->
            <cfset result = queryNew("pnID,pnOrderNo,pnColXl,pnColMd,pnTitle,pnFilename,pnDescription,IsDeleted", "integer,integer,integer,integer,varchar,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->
</cfcomponent>
