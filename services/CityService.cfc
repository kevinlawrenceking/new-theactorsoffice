<cfcomponent displayname="CityService" hint="Handles operations for City table" output="false"> 
<cffunction name="getCities" access="public" returntype="query">
    <cfargument name="countryId" type="numeric" required="false">
    <cfargument name="regionId" type="numeric" required="false">
    <cfargument name="cityName" type="string" required="false">

    <cfset var local = {}>

    <cfset local.queryString = "SELECT id, countryid, region_id, cityname FROM cities WHERE 1=1">
    
    <cfif structKeyExists(arguments, "countryId")>
        <cfset local.queryString &= " AND countryid = ?">
        <cfset arrayAppend(local.params, {value=arguments.countryId, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>
    
    <cfif structKeyExists(arguments, "regionId")>
        <cfset local.queryString &= " AND region_id = ?">
        <cfset arrayAppend(local.params, {value=arguments.regionId, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>
    
    <cfif structKeyExists(arguments, "cityName")>
        <cfset local.queryString &= " AND cityname LIKE ?">
        <cfset arrayAppend(local.params, {value=arguments.cityName & "%", cfsqltype="CF_SQL_VARCHAR"})>
    </cfif>

    <cfset local.queryString &= " ORDER BY cityname">

    <cftry>
        <cfquery name="local.result" datasource="abod">
            #local.queryString#
            <cfloop array="#local.params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfreturn local.result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error executing getCities query: #cfcatch.message# Query: #local.queryString# Parameters: #serializeJSON(local.params)#">
            <cfreturn queryNew("id,countryid,region_id,cityname")>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
