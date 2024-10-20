<cfcomponent displayname="ReportsMasterService" hint="Handles operations for ReportsMaster table" output="false" > 
<cffunction name="getreports_master" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfset var sql = "SELECT reportID, reportOrderNo, reporttypeid, colxl, colmd, colorid, reportName, reportDescription, datalabel, isDeleted FROM reports_master_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "reportID,reportOrderNo,reporttypeid,colxl,colmd,colorid,reportName,reportDescription,datalabel,isDeleted">
    <cfset var validOrderColumns = "reportID,reportOrderNo,reporttypeid,colxl,colmd,colorid">

    <cftry>
        <!--- Build WHERE clause dynamically --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de(listFindNoCase(validColumns,key))})>
            </cfif>
        </cfloop>

        <!--- Append WHERE clause to SQL if conditions exist --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif len(arguments.orderBy) and listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

        <!--- Return the result set --->
        <cfreturn result>

    <cfcatch type="any">
        <!--- Log the error details --->
        <cflog file="application" text="Error in getreports_master: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        
        <!--- Return an empty query on error --->
        <cfreturn queryNew("reportID,reportOrderNo,reporttypeid,colxl,colmd,colorid,reportName,reportDescription,datalabel,isDeleted", "integer,integer,integer,integer,integer,integer,varchar,varchar,varchar,bit")>
    </cfcatch>
    </cftry>
</cffunction> 

<!--- Changes made:
     - Removed unnecessary else block returning an empty query if no filters are provided.
     - Corrected the function to ensure it only returns an empty query on error.
--->
</cfcomponent>
