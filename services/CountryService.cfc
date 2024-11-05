<cfcomponent displayname="CountryService" hint="Handles operations for Country table" output="false"> 
<cffunction name="SELcountries" access="public" returntype="query">
    <cfargument name="countryid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
<cffunction name="SELcountries_24169" access="public" returntype="query">
    <cfargument name="countryName" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
<cffunction name="SELcountries_24637" access="public" returntype="query">
    <cfargument name="countryIds" type="array" required="true">
    
    <cfset var result = "">
    
  

        <cfquery name="result" datasource="abod">
SELECT countryid, countryname FROM countries 
    WHERE isdeleted = 0 and countryid in (select countryid from regions)
    ORDER BY countryname

        </cfquery>

        <cfreturn result>

 
</cffunction>
<cffunction name="SELcountries_24720" access="public" returntype="query">
    <cfargument name="countryName" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
