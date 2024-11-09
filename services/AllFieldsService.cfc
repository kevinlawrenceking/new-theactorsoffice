<cfcomponent displayname="AllFieldsService" hint="Handles operations for AllFields table" output="false"> 

    <cffunction name="getFilteredAllFields" access="public" returntype="query">
        <cfargument name="keyValue" type="string" required="true">
        <cfargument name="extraValue" type="string" required="true">
        <cfset var queryResult = "">

        <cfquery name="queryResult" datasource="abod">
            SELECT * 
            FROM allfields 
            WHERE [key] <> <cfqueryparam value="#arguments.keyValue#" cfsqltype="CF_SQL_VARCHAR">
            AND [extra] <> <cfqueryparam value="#arguments.extraValue#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>

        <cfreturn queryResult>
    </cffunction>

    <cffunction name="SELallfields_24310" access="public" returntype="query">
        <cfargument name="keyValue" type="string" required="true">
        <cfset var result = "">

        <cfquery name="result" datasource="abod">
            SELECT *
            FROM allfields
            WHERE [key] = <cfqueryparam value="#arguments.keyValue#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>

        <cfreturn result>
    </cffunction>

</cfcomponent>
