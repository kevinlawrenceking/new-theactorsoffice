<cfcomponent displayname="CityService" hint="Handles operations for City table" output="false"> 

    <cffunction name="SELcities" access="public" returntype="query" output="false">
        
        <cfquery name="result">
            SELECT 
                id, 
                countryid, 
                region_id, 
                cityname 
            FROM 
                cities 
            ORDER BY 
                cityname
        </cfquery>
        
        <cfreturn result>
        
    </cffunction>

</cfcomponent>