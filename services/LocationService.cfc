<cfcomponent displayname="LocationService" output="false" hint="Handles country and region-related operations.">
   <cffunction name="getCountries" access="public" returntype="query" output="false" hint="Fetches all countries that have regions">
        <cfquery result="result" name="qCountries" cachedwithin="#CreateTimeSpan(1, 0, 0, 0)#">
            SELECT countryid, countryname 
            FROM countries 
            WHERE isdeleted = 0 
            AND countryid IN (SELECT countryid FROM regions)
            ORDER BY countryname
        </cfquery>
        <cfreturn qCountries>
    </cffunction>
    <cffunction name="getRegions" access="public" returntype="query" output="false" hint="Fetches regions for the selected country">
        <cfquery result="result" name="qRegions" cachedwithin="#CreateTimeSpan(1, 0, 0, 0)#" >
            SELECT countryid, region_id, regionname 
            FROM regions 
            ORDER BY regionname
        </cfquery>
        <cfreturn qRegions>
    </cffunction>
</cfcomponent>
