<cfcomponent displayname="TicketTypeService" hint="Handles operations for TicketType table" output="false" > 
<cffunction name="gettickettypes" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="ID">
    
    <cfset var validColumns = "ID,tickettype">
    <cfset var validOrderByColumns = "ID,tickettype">
    <cfset var sql = "SELECT ID, tickettype FROM tickettypes WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <cftry>
        <!--- Build WHERE clause dynamically based on filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=key EQ 'ID' ? 'CF_SQL_INTEGER' : 'CF_SQL_VARCHAR', null=isNull(arguments.filters[key])})>
            </cfif>
        </cfloop>

        <!--- Append WHERE clauses if any --->
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
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#param.null#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in gettickettypes: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">

        <!--- Return an empty query with correct schema on error --->
        <cfset result = queryNew("ID,tickettype", "integer,varchar")>
    </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction></cfcomponent>
