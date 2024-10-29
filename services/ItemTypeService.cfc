<cfcomponent displayname="ItemTypeService" hint="Handles operations for ItemType table" output="false"> 
<cffunction name="getItemTypes" access="public" returntype="query">
    <cfargument name="catId" type="numeric" required="true">
    <cfargument name="excludeTypeId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT i.valuetype
            FROM itemtypes i
            INNER JOIN itemcatxref x ON x.typeid = i.typeid
            WHERE x.catid = <cfqueryparam value="#arguments.catId#" cfsqltype="CF_SQL_INTEGER">
            AND i.typeid <> <cfqueryparam value="#arguments.excludeTypeId#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY i.valuetype
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getItemTypes: #cfcatch.message#">
            <cfset result = queryNew("valuetype")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getItemTypes" access="public" returntype="query">
    <cfargument name="typeid" type="numeric" required="false">
    <cfargument name="valuetype" type="string" required="false">
    <cfargument name="typeicon" type="string" required="false">

    <cfset var queryResult = "">
    <cfset var whereClause = []>
    <cfset var params = []>

    <cftry>
        <!--- Construct WHERE clause dynamically based on provided arguments --->
        <cfif structKeyExists(arguments, "typeid") and not isNull(arguments.typeid)>
            <cfset arrayAppend(whereClause, "typeid = ?")>
            <cfset arrayAppend(params, {value=arguments.typeid, cfsqltype="CF_SQL_INTEGER"})>
        </cfif>

        <cfif structKeyExists(arguments, "valuetype") and not isNull(arguments.valuetype)>
            <cfset arrayAppend(whereClause, "valuetype = ?")>
            <cfset arrayAppend(params, {value=arguments.valuetype, cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>

        <cfif structKeyExists(arguments, "typeicon") and not isNull(arguments.typeicon)>
            <cfset arrayAppend(whereClause, "typeicon = ?")>
            <cfset arrayAppend(params, {value=arguments.typeicon, cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>

        <!--- Execute query only if there are conditions to prevent unfiltered queries --->
        <cfif arrayLen(whereClause) gt 0>
            <cfquery name="queryResult" datasource="yourDataSource">
                SELECT typeid, valuetype, typeicon
                FROM itemtypes
                WHERE #arrayToList(whereClause, " AND ")#
                <!--- Bind parameters securely --->
                <cfloop array="#params#" index="param">
                    <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
                </cfloop>
            </cfquery>
        </else>
            <!--- Return an empty query if no conditions are provided --->
            <cfquery name="queryResult" dbtype="query">
                SELECT typeid, valuetype, typeicon
                WHERE 1=0
            </cfquery>
        </cfif>

        <!--- Return the result set --->
        <cfreturn queryResult>

    <cfcatch type="any">
        <!--- Log error details for debugging --->
        <cflog file="application" text="Error in getItemTypes: #cfcatch.message#; Query: SELECT typeid, valuetype, typeicon FROM itemtypes WHERE #arrayToList(whereClause, ' AND ')#; Parameters: #serializeJSON(params)#">
        <!--- Return an empty query on error --->
        <cfreturn queryNew("typeid, valuetype, typeicon", "integer,varchar,varchar")>
    </cfcatch>
    </cftry>
</cffunction></cfcomponent>
