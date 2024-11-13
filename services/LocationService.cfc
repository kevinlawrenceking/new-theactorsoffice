<cfcomponent displayname="LocationService"  hint="Handles country and region-related operations.">
   <cffunction output="false" name="getCountries" access="public" returntype="query"  hint="Fetches all countries that have regions">
        <cfquery result="result" name="qCountries" cachedwithin="#CreateTimeSpan(1, 0, 0, 0)#">
            SELECT countryid, countryname 
            FROM countries 
            WHERE isdeleted = 0 
            AND countryid IN (SELECT countryid FROM regions)
            ORDER BY countryname
        </cfquery>
        <cfreturn qCountries>
    </cffunction>
    <cffunction output="false" name="getRegions" access="public" returntype="query"  hint="Fetches regions for the selected country">
        <cfquery result="result" name="qRegions" cachedwithin="#CreateTimeSpan(1, 0, 0, 0)#" >
            SELECT countryid, region_id, regionname 
            FROM regions 
            ORDER BY regionname
        </cfquery>
        <cfreturn qRegions>
    </cffunction>
</cfcomponent>
