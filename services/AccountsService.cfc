<cfcomponent displayname="AccountsService" hint="Handles operations for Accounts table" > 
    <cffunction output="false" name="SELaccounts" access="public" returntype="query">
        <cfargument name="accountID" type="numeric" required="true">
    
        
    
        <cfquery name="result">
            SELECT * 
            FROM accounts 
            WHERE id = <cfqueryparam value="#arguments.accountID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
 
        <cfreturn result>
    </cffunction>
</cfcomponent>