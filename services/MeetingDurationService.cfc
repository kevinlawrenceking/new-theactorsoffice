<cfcomponent displayname="MeetingDurationService" hint="Handles operations for MeetingDuration table" output="false" > 
<cffunction name="getmtgdurations" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="durID">
    
    <cfset var validColumns = "durID,durName,durHours">
    <cfset var validOrderColumns = "durID,durName,durHours">
    <cfset var sql = "SELECT durID, durName, durHours FROM mtgdurations WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfif isNull(arguments.filters[key])>
                <cfset arrayAppend(whereClause, "#key# IS NULL")>
            <cfelse>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=evaluate("CF_SQL_" & uCase(listGetAt(validColumns, listFindNoCase(validColumns, key))))})>
            </cfif>
        </cfif>
    </cfloop>

    <!--- Append WHERE clauses to SQL --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>

        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error in getmtgdurations: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

            <!--- Return an empty query with correct schema on error --->
            <cfset result = queryNew("durID,durName,durHours", "integer,varchar,decimal")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- No changes were necessary as the code is syntactically correct.
--->
</cfcomponent>
