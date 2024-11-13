<cfcomponent displayname="AllFieldsService" hint="Handles operations for AllFields table" > 

    <cffunction output="false" name="getFilteredAllFields" access="public" returntype="query">
        <cfargument name="keyValue" type="string" required="true">
        <cfargument name="extraValue" type="string" required="true">
        <cfset var queryResult = "">

        <cfquery result="result" name="queryResult">
            SELECT * 
            FROM allfields 
            WHERE [key] <> <cfqueryparam value="#arguments.keyValue#" cfsqltype="CF_SQL_VARCHAR">
            AND [extra] <> <cfqueryparam value="#arguments.extraValue#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>

        <cfreturn queryResult>
    </cffunction>

    <cffunction output="false" name="SELallfields_24310" access="public" returntype="query">
        <cfargument name="keyValue" type="string" required="true">
        <cfset var result = "">

        <cfquery name="result">
            SELECT *
            FROM allfields
            WHERE [key] = <cfqueryparam value="#arguments.keyValue#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>

        <cfreturn result>
    </cffunction>

</cfcomponent>