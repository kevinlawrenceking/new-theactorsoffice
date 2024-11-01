<cfcomponent displayname="AllFieldsService" hint="Handles operations for AllFields table" output="false"> 
<cffunction name="getFilteredAllFields" access="public" returntype="query">
    <cfargument name="keyValue" type="string" required="true">
    <cfargument name="extraValue" type="string" required="true">
    <cfset var queryResult = "">

    <cftry>
        <cfquery name="queryResult" datasource="abod">
            SELECT * 
            FROM allfields 
            WHERE [key] <> <cfqueryparam value="#arguments.keyValue#" cfsqltype="CF_SQL_VARCHAR">
            AND [extra] <> <cfqueryparam value="#arguments.extraValue#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog type="error" text="Error executing query in getFilteredAllFields: #cfcatch.message#">
            <!-- Return an empty query set on error -->
            <cfreturn queryNew("column1,column2")> <!-- Modify with actual column names if known -->
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction>



<cffunction name="SELallfields_24310" access="public" returntype="query">
    <cfargument name="keyValue" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM allfields
            WHERE [key] = <cfqueryparam value="#arguments.keyValue#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAllFieldsByKey: #cfcatch.message# Query: SELECT * FROM allfields WHERE [key] = ? Parameters: #arguments.keyValue#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
