<cfcomponent displayname="Audition Import Service" output="false">

    <cffunction name="auditionImports" access="public" returntype="query" hint="Returns a query of imports from auditionsimport table">
        <cfquery name="imports" >
            SELECT uploadid, timestamp
            FROM auditionsimport
        </cfquery>
        <cfreturn imports>
    </cffunction>

</cfcomponent>
