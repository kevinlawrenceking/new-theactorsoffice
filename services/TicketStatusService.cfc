<cfcomponent displayname="TicketStatusService" hint="Handles operations for TicketStatus table" output="false"> 
<cffunction name="getTicketStatuses" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var result = "">
    <cfset var sql = "SELECT ticketstatus AS id, ticketstatus AS name FROM ticketstatuses">
    <cfset var whereClauses = []>
    <cfset var params = []>

    <!--- Validate and build WHERE clauses --->
    <cfloop collection="#arguments.conditions#" item="key">
        <cfif listFindNoCase("ticketstatus", key)>
            <cfset arrayAppend(whereClauses, "#key# = ?")>
            <cfset arrayAppend(params, {value=arguments.conditions[key], cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause if conditions exist --->
    <cfif arrayLen(whereClauses) gt 0>
        <cfset sql &= " WHERE " & arrayToList(whereClauses, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfset sql &= " ORDER BY id">

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing getTicketStatuses: #cfcatch.message# SQL: #sql# Params: #serializeJSON(params)#">
            <cfthrow message="An error occurred while retrieving ticket statuses." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction>
<cffunction name="getTicketStatuses" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT ticketstatus AS name FROM ticketstatuses">
    <cfset var whereClause = "">
    <cfset var paramList = []>

    <!--- Build WHERE clause dynamically --->
    <cfif structCount(arguments.conditions) gt 0>
        <cfset whereClause = " WHERE ">
        <cfloop collection="#arguments.conditions#" item="key">
            <cfset whereClause &= "#key# = ? AND ">
            <cfset arrayAppend(paramList, {value=arguments.conditions[key], cfsqltype=determineSQLType(key)})>
        </cfloop>
        <!--- Remove trailing 'AND ' --->
        <cfset whereClause = left(whereClause, len(whereClause) - 4)>
    </cfif>

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="yourDataSource">
            #sql##whereClause#
            <cfloop array="#paramList#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing getTicketStatuses: #cfcatch.message# Query: #sql##whereClause# Parameters: #serializeJSON(paramList)#">
            <cfreturn queryNew("name")>
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction>
<cffunction name="getTicketStatuses" access="public" returntype="query">
    <cfargument name="status" type="string" required="false">
    
    <cfset var result = "">
    <cfset var sql = "">
    <cfset var params = []>
    
    <cftry>
        <cfset sql = "
            SELECT 'Completed' AS id, 'Completed' AS name 
            FROM ticketstatuses 
            WHERE 1=1
        ">
        
        <cfif structKeyExists(arguments, "status") and len(trim(arguments.status))>
            <cfset sql &= " AND name = ?">
            <cfset arrayAppend(params, {value=arguments.status, cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>

        <cfset sql &= "
            UNION 
            SELECT 'Pending' AS id, 'Pending' AS name 
            FROM ticketstatuses
            WHERE 1=1
        ">
        
        <cfif structKeyExists(arguments, "status") and len(trim(arguments.status))>
            <cfset sql &= " AND name = ?">
            <cfset arrayAppend(params, {value=arguments.status, cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>

        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

        <cfreturn result>

    <cfcatch type="any">
        <cflog file="application" text="Error in getTicketStatuses: #cfcatch.message# Query: #sql# Parameters: #serializeJSON(params)#">
        <cfthrow message="An error occurred while retrieving ticket statuses.">
    </cfcatch>
    </cftry>
</cffunction></cfcomponent>
