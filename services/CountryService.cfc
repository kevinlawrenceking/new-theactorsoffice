<cfcomponent displayname="CountryService" hint="Handles operations for Country table" output="false"> 
<cffunction name="getCountryById" access="public" returntype="query">
    <cfargument name="countryid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT countryid, countryname
            FROM countries
            WHERE countryid = <cfqueryparam value="#arguments.countryid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getCountryById: #cfcatch.message#; Query: SELECT countryid, countryname FROM countries WHERE countryid = #arguments.countryid#;">
            <cfthrow message="Database error occurred. Please try again later.">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getCountriesByCountryName" access="public" returntype="query">
    <cfargument name="countryName" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM countries 
            WHERE countryname = <cfqueryparam value="#arguments.countryName#" cfsqltype="cf_sql_varchar">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getCountriesByCountryName: #cfcatch.message# Query: SELECT * FROM countries WHERE countryname = ? Parameters: #arguments.countryName#">
            <cfthrow message="Database query error" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getCountries" access="public" returntype="query">
    <cfargument name="countryIds" type="array" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfif arrayLen(arguments.countryIds) eq 0>
            <!--- Return an empty query if no country IDs are provided --->
            <cfreturn queryNew("countryid,countryname", "integer,varchar")>
        </cfif>

        <cfquery name="result" datasource="abod">
            SELECT countryid, countryname 
            FROM countries 
            WHERE isdeleted = 0 
            AND countryid IN (
                SELECT countryid FROM regions
            )
            AND countryid IN (
                <cfloop index="i" from="1" to="#arrayLen(arguments.countryIds)#">
                    <cfqueryparam value="#arguments.countryIds[i]#" cfsqltype="CF_SQL_INTEGER" />
                    <cfif i LT arrayLen(arguments.countryIds)>,</cfif>
                </cfloop>
            )
            ORDER BY countryname
        </cfquery>

        <cfreturn result>

    <cfcatch type="any">
        <cflog file="application" text="Error in getCountries: #cfcatch.message# Query: #result.sql# Parameters: #arguments.countryIds#">
        <cfthrow message="An error occurred while retrieving countries." detail="#cfcatch.detail#">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getCountriesByCountryName" access="public" returntype="query">
    <cfargument name="countryName" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM countries 
            WHERE countryname = <cfqueryparam value="#arguments.countryName#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getCountriesByCountryName: #cfcatch.message# Query: SELECT * FROM countries WHERE countryname = ? Parameters: #arguments.countryName#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
