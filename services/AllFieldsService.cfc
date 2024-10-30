<cfcomponent displayname="AllFieldsService" hint="Handles operations for AllFields table" output="false"> 
<cfscript>
function getFilteredAllFields(keyValue, extraValue) {
    var queryResult = "";
    var sqlQuery = "SELECT * FROM allfields WHERE [key] <> ? AND [extra] <> ?";
    
    try {
        queryResult = new Query(
            sql=sqlQuery,
            parameters=[
                {value=keyValue, cfsqltype="CF_SQL_VARCHAR"},
                {value=extraValue, cfsqltype="CF_SQL_VARCHAR"}
            ]
        ).execute().getResult();
    } catch (any e) {
        cflog(type="error", text="Error executing query in getFilteredAllFields: #e.message#");
        return queryNew(""); // Return an empty query set on error
    }
    
    return queryResult;
}
</cfscript>


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
