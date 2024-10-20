<cfcomponent displayname="AuditionNetworkUserService" hint="Handles operations for AuditionNetworkUser table" output="false" > 
<cffunction name="insertaudnetworks_user" access="public" returntype="numeric">
    <cfargument name="networkid" type="numeric" required="true">
    <cfargument name="network" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="audCatid" type="numeric" required="false" default="2">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>
    <cfargument name="recordname" type="string" required="false">

    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            INSERT INTO audnetworks_user_tbl (
                networkid, 
                network, 
                userid, 
                audCatid, 
                isDeleted, 
                recordname
            ) VALUES (
                <cfqueryparam value="#arguments.networkid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.network#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
            )
        </cfquery>
        
        <cfset insertResult = result.generatedKey>

        <cfcatch>
            <cflog file="application" text="Error in insertaudnetworks_user: #cfcatch.message# Details: #cfcatch.detail#">
            <cflog file="application" text="SQL Query: INSERT INTO audnetworks_user_tbl (networkid, network, userid, audCatid, isDeleted, recordname) VALUES (#arguments.networkid#, #arguments.network#, #arguments.userid#, #arguments.audCatid#, #arguments.isDeleted#, #arguments.recordname#)">
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction> 

<!--- Changes made:
- None. The function code is syntactically correct.
--->
</cfcomponent>
