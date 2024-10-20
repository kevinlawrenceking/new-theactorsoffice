<cfcomponent displayname="RegionService" hint="Handles operations for Region table" output="false" > 
<cffunction name="getregions" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="region_id">
    
    <cfset var sql = "SELECT region_id, country_auto_id, regionid, countryid, regionName FROM regions WHERE 1=1">
    <cfset var params = []>
    <cfset var validColumns = "region_id,country_auto_id,regionid,countryid,regionName">
    <cfset var validOrderColumns = "region_id,country_auto_id,regionid,countryid,regionName">
    <cfset var queryResult = "">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset sql &= " AND #key# = ?">
            <cfset arrayAppend(params, {value=arguments.filters[key], cfsqltype=getCFSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Add ORDER BY clause if valid --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query within a try/catch block --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch>
            <!--- Log error details --->
            <cflog file="application" text="Error in getregions: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            
            <!--- Return an empty query with matching columns and types --->
            <cfset queryResult = queryNew("region_id,country_auto_id,regionid,countryid,regionName", "integer,integer,varchar,varchar,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn queryResult>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->
</cfcomponent>
