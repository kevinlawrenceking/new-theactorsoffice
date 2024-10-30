<cfcomponent displayname="FTypeXRefService" hint="Handles operations for FTypeXRef table" output="false"> 
<cffunction name="SELftypexref" access="public" returntype="query">
    <cfargument name="type" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT cfparam 
            FROM ftypexref_tbl 
            WHERE ftypefull = <cfqueryparam value="#arguments.type#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error in getCFParamByType: #cfcatch.message#; Query: SELECT cfparam FROM ftypexref_tbl WHERE ftypefull = ?; Parameters: #arguments.type#">
            <cfset result = queryNew("cfparam")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
