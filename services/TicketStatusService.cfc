<cfcomponent displayname="TicketStatusService" hint="Handles operations for TicketStatus table" output="false" > 
<cffunction name="getticketstatuses" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="id">
    
    <cfset var sql = "SELECT id, ticketstatus FROM ticketstatuses WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "id,ticketstatus">
    <cfset var validOrderColumns = "id,ticketstatus">
    <cfset var resultQuery = "">
    
    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>
    
    <!--- Append WHERE clause to SQL if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="resultQuery" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getticketstatuses: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query on error --->
            <cfset resultQuery = queryNew("id,ticketstatus", "integer,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn resultQuery>
</cffunction>
<cffunction name="getvm_ticketstatuses_status_names" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="id">
    
    <cfset var validColumns = "id,ticketstatus">
    <cfset var validOrderByColumns = "id,ticketstatus">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var sql = "SELECT id, ticketstatus FROM ticketstatuses WHERE 1=1">
    <cfset var result = "">

    <!--- Build the WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>
    </cfloop>

    <!--- Add WHERE clauses to SQL if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch>
            <!--- Log the error --->
            <cflog file="application" text="Error in getvm_ticketstatuses_status_names: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with matching schema --->
            <cfset result = queryNew("id,ticketstatus", "varchar,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction></cfcomponent>
