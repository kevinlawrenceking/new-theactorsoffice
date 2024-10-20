<cfcomponent displayname="ReportRangeService" hint="Handles operations for ReportRange table" output="false" > 
<cffunction name="getreportranges" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="rangeid">
    
    <cfset var validColumns = "rangeid,rangename,rangestart,rangeend">
    <cfset var validOrderByColumns = "rangeid,rangename,rangestart,rangeend">
    <cfset var sql = "SELECT rangeid, rangename, rangestart, rangeend FROM reportranges WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryResult = "">

    <cftry>
        <!--- Build dynamic WHERE clause --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- Append WHERE conditions if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" 
                                  cfsqltype="#evaluate('CF_SQL_' & uCase(listGetAt(validColumns, listFindNoCase(validColumns, key))))#" 
                                  null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

        <!--- Return the result --->
        <cfreturn queryResult>

    <cfcatch type="any">
        <!--- Log the error details --->
        <cflog file="errorLog" text="Error in getreportranges: #cfcatch.message#, Details: #cfcatch.detail#, SQL: #sql#">

        <!--- Return an empty query with the correct schema --->
        <cfreturn queryNew("rangeid,rangename,rangestart,rangeend", "integer,varchar,date,date")>
    </cfcatch>
    </cftry>
</cffunction>

<!--- Changes made:
- No changes were necessary as the provided code is syntactically correct.
--->

<cffunction name="updatereportranges" access="public" returntype="boolean">
    <cfargument name="rangeid" type="numeric" required="true">
    <cfargument name="rangename" type="string" required="false" default="">
    <cfargument name="rangestart" type="date" required="false" default="">
    <cfargument name="rangeend" type="date" required="false" default="">
    
    <cfset var sql = "UPDATE reportranges SET">
    <cfset var setClauses = []>
    <cfset var result = false>
    
    <cfif len(arguments.rangename)>
        <cfset arrayAppend(setClauses, "rangename = ?")>
    </cfif>
    
    <cfif len(arguments.rangestart)>
        <cfset arrayAppend(setClauses, "rangestart = ?")>
    </cfif>
    
    <cfif len(arguments.rangeend)>
        <cfset arrayAppend(setClauses, "rangeend = ?")>
    </cfif>
    
    <!--- If no fields to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Build the SQL statement --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE rangeid = ?">

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfif len(arguments.rangename)>
                <cfqueryparam value="#arguments.rangename#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.rangename)#">
            </cfif>
            <cfif len(arguments.rangestart)>
                <cfqueryparam value="#arguments.rangestart#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.rangestart)#">
            </cfif>
            <cfif len(arguments.rangeend)>
                <cfqueryparam value="#arguments.rangeend#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.rangeend)#">
            </cfif>
            <cfqueryparam value="#arguments.rangeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If query is successful, set result to true --->
        <cfset result = true>

        <!--- Handle any errors that occur during the query execution --->
        <cfcatch type="any">
            <cflog file="application" text="Error in updatereportranges: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Optionally, handle the error further or rethrow --->
        </cfcatch>
    </cftry>

    <!--- Return the result of the update operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Added missing closing tag for cftry.
--->

<cffunction name="getvm_reportranges_excluded" access="public" returntype="query">
    <cfargument name="new_sitetypeid" type="numeric" required="true">
    <cfargument name="orderBy" type="string" required="false" default="rangeid">
    
    <cfset var result = "">
    <cfset var sql = "SELECT rangeid, rangename, rangestart, rangeend FROM vm_reportranges_excluded WHERE 1=1">
    <cfset var validOrderByColumns = "rangeid,rangename,rangestart,rangeend">

    <!--- Append the condition for sitetypeid --->
    <cfset sql &= " AND sitetypeid = ?">

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    <cfelse>
        <cfset sql &= " ORDER BY rangeid">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfqueryparam value="#arguments.new_sitetypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getvm_reportranges_excluded: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

            <!--- Return an empty query with the correct schema --->
            <cfset result = queryNew("rangeid,rangename,rangestart,rangeend", "integer,varchar,date,date")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction></cfcomponent>
