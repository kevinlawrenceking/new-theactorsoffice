<cfcomponent displayname="EventTypesService" hint="Handles operations for EventTypes table" output="false"> 
<cffunction name="getEventTypes" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT eventTypeName, eventtypedescription, eventtypecolor FROM eventtypes">
    <cfset var whereClauses = []>
    <cfset var paramValues = []>
    
    <!--- Add WHERE clauses dynamically based on filters --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase("eventTypeName,eventtypedescription,eventtypecolor", key)>
            <cfset arrayAppend(whereClauses, "#key# = ?")>
            <cfset arrayAppend(paramValues, {value=arguments.filters[key], cfsqltype=determineSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Construct final SQL statement --->
    <cfif arrayLen(whereClauses) gt 0>
        <cfset sql &= " WHERE " & arrayToList(whereClauses, " AND ")>
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="yourDataSource">
            #sql#
            <cfloop array="#paramValues#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="errorLog" text="Error executing query: #cfcatch.message# - SQL: #sql# - Params: #serializeJSON(paramValues)#">
            <cfreturn queryNew("eventTypeName,eventtypedescription,eventtypecolor")>
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction></cfcomponent>
