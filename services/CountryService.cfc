<cfcomponent displayname="CountryService" hint="Handles operations for Country table" output="false"> 
<cffunction name="SELcountries" access="public" returntype="query">
    <cfargument name="countryid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT countryid, countryname
        FROM countries
        WHERE countryid = <cfquery result="result" param value="#arguments.countryid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcountries_24169" access="public" returntype="query">
    <cfargument name="countryName" type="string" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT * 
        FROM countries 
        WHERE countryname = <cfquery result="result" param value="#arguments.countryName#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcountries_24637" access="public" returntype="query">
    <cfargument name="countryIds" type="array" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT countryid, countryname FROM countries 
        WHERE isdeleted = 0 and countryid in (select countryid from regions)
        ORDER BY countryname
    </cfquery>

    <cfreturn result>
</cffunction>
<cffunction name="SELcountries_24720" access="public" returntype="query">
    <cfargument name="countryName" type="string" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT * 
        FROM countries 
        WHERE countryname = <cfquery result="result" param value="#arguments.countryName#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>
    
    <cfreturn result>
</cffunction></cfcomponent>