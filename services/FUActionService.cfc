<cfcomponent displayname="FUActionService" hint="Handles operations for FUAction table" output="false"> 
<cffunction name="SELfuactions" access="public" returntype="query">
    <cfargument name="target_id_system" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT actionid, actiondaysno, actiondaysrecurring
            FROM fuactions
            WHERE actionid IN (
                SELECT actionid 
                FROM fuactions 
                WHERE systemid = <cfqueryparam value="#arguments.target_id_system#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getFuActions: #cfcatch.message#">
            <cfset result = queryNew("actionid,actiondaysno,actiondaysrecurring")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELfuactions_24453" access="public" returntype="query">
    <cfargument name="actionId" type="numeric" required="false">
    <cfargument name="actionDaysNo" type="numeric" required="false">
    <cfargument name="actionDaysRecurring" type="numeric" required="false">

    <cfset var queryResult = "">
    
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            SELECT actionid, actiondaysno, actiondaysrecurring
            FROM fuactions
            WHERE 1=1
            <cfif structKeyExists(arguments, "actionId")>
                AND actionid = <cfqueryparam value="#arguments.actionId#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif structKeyExists(arguments, "actionDaysNo")>
                AND actiondaysno = <cfqueryparam value="#arguments.actionDaysNo#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif structKeyExists(arguments, "actionDaysRecurring")>
                AND actiondaysrecurring = <cfqueryparam value="#arguments.actionDaysRecurring#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
        </cfquery>

        <!--- Return the query result --->
        <cfreturn queryResult>

        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getFuActions: #cfcatch.message# - Query: SELECT actionid, actiondaysno, actiondaysrecurring FROM fuactions - Parameters: #serializeJSON(arguments)#">
            
            <!--- Return an empty query if an error occurs --->
            <cfreturn queryNew("actionid,actiondaysno,actiondaysrecurring", "integer,integer,integer")>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
