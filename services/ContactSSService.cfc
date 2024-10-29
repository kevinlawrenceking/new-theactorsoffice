<cfcomponent displayname="ContactSSService" hint="Handles operations for ContactSS table" output="false"> 
<cffunction name="getContactsByUserId" access="public" returntype="query">
    <cfargument name="userId" type="numeric" required="true">
    
    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT col1 
            FROM contacts_ss 
            WHERE userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER"> 
            AND col1 NOT LIKE <cfqueryparam value="%#chr(34)#%" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getContactsByUserId: #cfcatch.message# Query: SELECT col1 FROM contacts_ss WHERE userid = ? AND col1 NOT LIKE ?">
            <cfrethrow>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getContactID" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="topsearch_myteam" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT CONTACTID 
            FROM contacts_ss 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND col1 = <cfqueryparam value="#arguments.topsearch_myteam#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactID: #cfcatch.message# Query: SELECT CONTACTID FROM contacts_ss WHERE userid = #arguments.userid# AND col1 = '#arguments.topsearch_myteam#'">
            <cfset result = queryNew("CONTACTID")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
