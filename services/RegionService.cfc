<cfcomponent displayname="RegionService" hint="Handles operations for Region table" output="false"> 

    <!--- Function to retrieve all regions ordered by region name --->
    <cffunction name="GetRegions" access="public" returntype="query" output="false" hint="Retrieve all regions ordered by region name.">

        <!--- Initialize the query variable --->
        <cfset var regions = "">

        <!--- Query to fetch regions --->
        <cfquery name="regions" >
            SELECT 
                countryid, 
                region_id, 
                regionname 
            FROM 
                regions 
            ORDER BY 
                regionname
        </cfquery>

        <cfreturn regions>
    </cffunction>


<cffunction name="SELregions" access="public" returntype="query">
    <cfargument name="region_id" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT regionname 
            FROM regions 
            WHERE region_id = <cfqueryparam value="#arguments.region_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getRegionNameById: #cfcatch.message# Query: SELECT regionname FROM regions WHERE region_id = #arguments.region_id#">
            <cfthrow message="An error occurred while retrieving the region name." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELregions_24170" access="public" returntype="query">
    <cfargument name="valueregion" type="string" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT region_id 
            FROM regions 
            WHERE regionname = <cfqueryparam value="#arguments.valueregion#" cfsqltype="cf_sql_varchar">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getRegionIdByRegionName: #cfcatch.message#">
            <cfset result = queryNew("region_id")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELregions_24177" access="public" returntype="query">
    <cfargument name="region_id" type="numeric" required="true">
    <cfargument name="old_countryid" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT regionname 
            FROM regions 
            WHERE region_id = <cfqueryparam value="#arguments.region_id#" cfsqltype="CF_SQL_INTEGER"> 
            AND countryid = <cfqueryparam value="#arguments.old_countryid#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getRegionName function: #cfcatch.message#">
            <cfreturn queryNew("regionname")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELregions_24717" access="public" returntype="query">
    <cfargument name="regionID" type="numeric" required="false">
    <cfargument name="regionName" type="string" required="false">

    <cfset var queryResult = "">
    <cfset var sql = "SELECT countryid, region_id, regionname FROM regions">
    <cfset var conditions = []>
    <cfset var params = []>

    <!--- Build WHERE clause dynamically --->
    <cfif structKeyExists(arguments, "regionID")>
        <cfset arrayAppend(conditions, "region_id = ?")>
        <cfset arrayAppend(params, {value=arguments.regionID, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "regionName")>
        <cfset arrayAppend(conditions, "regionname = ?")>
        <cfset arrayAppend(params, {value=arguments.regionName, cfsqltype="CF_SQL_VARCHAR"})>
    </cfif>

    <!--- Append conditions to SQL if any --->
    <cfif arrayLen(conditions) gt 0>
        <cfset sql &= " WHERE " & arrayToList(conditions, " AND ")>
    </cfif>

    <!--- Append ORDER BY clause --->
    <cfset sql &= " ORDER BY regionname">

    <!--- Execute the query --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error executing getRegions: #cfcatch.message# Query: #sql# Parameters: #serializeJSON(params)#">
            <!--- Return an empty query if there's an error --->
            <cfset queryResult = queryNew("countryid,region_id,regionname", "integer,integer,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction>
<cffunction name="SELregions_24721" access="public" returntype="query">
    <cfargument name="regionName" type="string" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT region_id
            FROM regions
            WHERE regionname = <cfqueryparam value="#arguments.regionName#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getRegionIdByRegionName: #cfcatch.message# Query: SELECT region_id FROM regions WHERE regionname = ? Parameters: #arguments.regionName#">
            <cfreturn queryNew("region_id", "integer")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
