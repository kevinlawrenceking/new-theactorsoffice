<cfcomponent displayname="Audition Import Service" output="false">


    <cffunction name="DETauditionsimport" access="public" returntype="query" output="false">
        <!--- Arguments --->
        <cfargument name="uploadid" type="numeric" required="true">

        <!--- Query --->
        <cfquery name="result" datasource="#application.dsn#">
            SELECT 
                audprojectid 
            FROM 
                auditionsimport 
            WHERE 
                uploadid = <cfqueryparam value="#arguments.uploadid#" cfsqltype="CF_SQL_INTEGER"> 
                AND status = 'Added'
        </cfquery>

        <!--- Return Query Result --->
        <cfreturn result>
    </cffunction>
    
    <cffunction name="auditionImports" access="public" returntype="query" hint="Returns a query of imports from auditionsimport table">
        <cfquery name="imports" >
            SELECT uploadid, timestamp
            FROM auditionsimport
        </cfquery>
        <cfreturn imports>
    </cffunction>

</cfcomponent>
