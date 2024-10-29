<cfcomponent displayname="SiteTypeMasterService" hint="Handles operations for SiteTypeMaster table" output="false"> 
<cffunction name="getSiteTypesByName" access="public" returntype="query">
    <cfargument name="sitetypename" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM sitetypes_master
            WHERE sitetypename = <cfqueryparam value="#arguments.sitetypename#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSiteTypesByName: #cfcatch.message#">
            <cfset result = queryNew("id", "integer")> <!--- Return an empty query set --->
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getSiteTypes" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT sitetypename, sitetypedescription FROM sitetypes_master">
    <cfset var whereClauses = []>
    <cfset var paramList = []>

    <!--- Build WHERE clauses dynamically based on arguments --->
    <cfloop collection="#arguments.conditions#" item="key">
        <cfif listFindNoCase("sitetypename,sitetypedescription", key)>
            <cfset arrayAppend(whereClauses, "#key# = ?")>
            <cfset arrayAppend(paramList, {value=arguments.conditions[key], cfsqltype="CF_SQL_VARCHAR"})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause if conditions exist --->
    <cfif arrayLen(whereClauses) gt 0>
        <cfset sql = sql & " WHERE " & arrayToList(whereClauses, " AND ")>
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop array="#paramList#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing getSiteTypes: #cfcatch.message# SQL: #sql# Parameters: #serializeJSON(paramList)#">
            <cfreturn queryNew("sitetypename,sitetypedescription", "varchar,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction></cfcomponent>
