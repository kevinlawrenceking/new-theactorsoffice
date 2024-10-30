<cfcomponent displayname="AuditionPayCycleService" hint="Handles operations for AuditionPayCycle table" output="false"> 
<cffunction name="SELaudpaycycles" access="public" returntype="query">
    <cfargument name="paycycleid" type="numeric" required="false">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT paycycleid AS id, paycycle AS name
            FROM audpaycycles
            WHERE 1=1
            <cfif structKeyExists(arguments, "paycycleid")>
                AND paycycleid = <cfqueryparam value="#arguments.paycycleid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            ORDER BY paycycle
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getPayCycles: #cfcatch.message# - Query: SELECT paycycleid AS id, paycycle AS name FROM audpaycycles WHERE paycycleid = #arguments.paycycleid# ORDER BY paycycle">
            <cfset result = queryNew("id,name", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELaudpaycycles_24579" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT paycycleid AS id, paycyclename AS name FROM audpaycycles">
    <cfset var whereClause = "">
    <cfset var paramList = []>
    
    <!--- Construct WHERE clause dynamically --->
    <cfif structCount(arguments.conditions) gt 0>
        <cfset whereClause = " WHERE ">
        <cfloop collection="#arguments.conditions#" item="key">
            <cfif key eq "id">
                <cfset whereClause &= "paycycleid = ? AND ">
                <cfset arrayAppend(paramList, {value=arguments.conditions[key], cfsqltype="CF_SQL_INTEGER"})>
            </cfif>
            <cfif key eq "name">
                <cfset whereClause &= "paycyclename LIKE ? AND ">
                <cfset arrayAppend(paramList, {value=arguments.conditions[key], cfsqltype="CF_SQL_VARCHAR"})>
            </cfif>
        </cfloop>
        <!--- Remove trailing 'AND ' --->
        <cfset whereClause = left(whereClause, len(whereClause) - 4)>
    </cfif>

    <!--- Complete SQL statement --->
    <cfset sql &= whereClause & " ORDER BY paycyclename">

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop array="#paramList#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing getPayCycles: #cfcatch.message# Query: #sql# Parameters: #serializeJSON(paramList)#">
            <cfthrow message="An error occurred while retrieving pay cycles." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction></cfcomponent>
