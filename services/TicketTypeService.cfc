<cfcomponent displayname="TicketTypeService" hint="Handles operations for TicketType table" output="false"> 
<cffunction name="getTicketTypes" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT tickettype AS id, tickettype AS name FROM tickettypes">
    <cfset var whereClauses = []>
    <cfset var paramList = []>

    <!--- Validate and construct WHERE clause --->
    <cfloop collection="#arguments.conditions#" item="key">
        <cfif listFindNoCase("tickettype", key)>
            <cfset arrayAppend(whereClauses, "#key# = ?")>
            <cfset arrayAppend(paramList, {value=arguments.conditions[key], cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause if conditions exist --->
    <cfif arrayLen(whereClauses) gt 0>
        <cfset sql &= " WHERE " & arrayToList(whereClauses, " AND ")>
    </cfif>

    <!--- Append ORDER BY clause --->
    <cfset sql &= " ORDER BY tickettype">

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop array="#paramList#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing getTicketTypes: #cfcatch.message# SQL: #sql# Parameters: #serializeJSON(paramList)#">
            <cfreturn queryNew("id,name", "varchar,varchar")> <!--- Return empty query on error --->
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction></cfcomponent>
