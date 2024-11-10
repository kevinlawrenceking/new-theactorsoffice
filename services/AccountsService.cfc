<cfcomponent displayname="AccountsService" hint="Handles operations for Accounts table" output="false"> 
    <cffunction name="SELaccounts" access="public" returntype="query">
        <cfargument name="accountID" type="numeric" required="true">
    
        <cfset var result = "">
    
        <cfquery name="result">
            SELECT * 
            FROM accounts 
            WHERE id = <cfqueryparam value="#arguments.accountID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
 
        <cfreturn result>
    </cffunction>
</cfcomponent>