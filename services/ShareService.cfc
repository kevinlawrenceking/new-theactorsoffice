<cfcomponent displayname="ShareService" hint="Handles operations for Share table" > 
    <cffunction output="false" name="SELshares" access="public" returntype="query">
        <cfargument name="userId" type="numeric" required="true">
        <cfset var result = "">

        <cfquery name="result">
            SELECT *
            FROM shares
            WHERE userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfreturn result>
    </cffunction>
</cfcomponent>