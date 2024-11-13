<cfcomponent displayname="TicketTypeService" hint="Handles operations for TicketType table" > 
<cffunction output="false" name="SELtickettypes" access="public" returntype="query">
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

    <!--- Execute query without error handling --->
    <cfquery result="result" name="queryResult">
        #sql#
        <cfloop array="#paramList#" index="param">
            <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
    </cfquery>

    <cfreturn queryResult>
</cffunction>
</cfcomponent>