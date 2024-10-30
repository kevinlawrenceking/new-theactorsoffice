<cfcomponent displayname="AccountsService" hint="Handles operations for Accounts table" output="false"> 
<cffunction name="SELaccounts" access="public" returntype="query">
    <cfargument name="accountID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM accounts 
            WHERE id = <cfqueryparam value="#arguments.accountID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getAccountById: #cfcatch.message#; Query: SELECT * FROM accounts WHERE id = #arguments.accountID#;">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
