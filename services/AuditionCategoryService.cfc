<cfcomponent displayname="AuditionCategoryService" hint="Handles operations for AuditionCategory table" > 

<cffunction name="SELaudcategories_24033" access="public" returntype="query" output="false">

    <cfquery name="categories">
        SELECT audcatid, audcatname
        FROM audcategories
        WHERE isdeleted = 0
        ORDER BY audcatname
    </cfquery>
    <cfreturn categories>

</cffunction>

</cfcomponent>