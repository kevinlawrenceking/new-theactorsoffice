<cfcomponent displayname="TicketPriorityService" hint="Handles operations for TicketPriority table" output="false" > 
<cffunction name="getticketpriority" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="ID">

    <cfset var sql = "SELECT ID, ticketPriority, OrderNo FROM ticketpriority WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "ID,ticketPriority,OrderNo">
    <cfset var validOrderByColumns = "ID,ticketPriority,OrderNo">
    <cfset var result = "">

    <cftry>
        <!--- Build WHERE clause dynamically based on filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de(listFindNoCase(validColumns, key))})>
            </cfif>
        </cfloop>

        <!--- Append WHERE clauses to SQL if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

    <cfcatch>
        <!--- Log error details --->
        <cflog file="application" text="Error in getticketpriority: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

        <!--- Return an empty query with correct schema on error --->
        <cfset result = queryNew("ID,ticketPriority,OrderNo", "integer,varchar,integer")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Corrected missing closing tag for cffunction.
--->
</cfcomponent>
