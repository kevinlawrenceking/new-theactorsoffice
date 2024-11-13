<cfcomponent displayname="FTypeXRefService" hint="Handles operations for FTypeXRef table" output="false"> 
    <cffunction name="SELftypexref" access="public" returntype="query">
        <cfargument name="type" type="string" required="true">

        <cfset var result = "">

        <cfquery name="result">
            SELECT cfparam 
            FROM ftypexref_tbl 
            WHERE ftypefull = <cfquery result="result" param value="#arguments.type#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>

        <cfreturn result>
    </cffunction>
</cfcomponent>