<cfcomponent displayname="AuditionNetworkService" hint="Handles operations for AuditionNetwork table" output="false" > 
<cffunction name="insertaudnetworks" access="public" returntype="numeric">
    <cfargument name="networkid" type="numeric" required="true">
    <cfargument name="network" type="string" required="true">
    <cfargument name="audCatid" type="numeric" required="false" default="2">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>
    <cfargument name="recordname" type="string" required="false">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audnetworks (networkid, network, audCatid, isDeleted, recordname) VALUES (?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            #sql#
            <cfqueryparam value="#arguments.networkid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.network#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into audnetworks: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return 0 or another appropriate indicator for failure --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Added missing closing tag for cfcatch.
--->

<cffunction name="updateaudnetworks" access="public" returntype="boolean">
    <cfargument name="networkid" type="numeric" required="true">
    <cfargument name="network" type="string" required="false" default="">
    <cfargument name="audCatid" type="numeric" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false" default="">
    <cfargument name="recordname" type="string" required="false" default="">
    
    <cfset var sql = "UPDATE audnetworks SET">
    <cfset var setClauses = []>
    <cfset var result = false>

    <cftry>
        <!--- Build the SET clause dynamically based on provided arguments --->
        <cfif len(arguments.network)>
            <cfset arrayAppend(setClauses, "network = ?")>
        </cfif>
        <cfif isNumeric(arguments.audCatid)>
            <cfset arrayAppend(setClauses, "audCatid = ?")>
        </cfif>
        <cfif isBoolean(arguments.isDeleted)>
            <cfset arrayAppend(setClauses, "isDeleted = ?")>
        </cfif>
        <cfif len(arguments.recordname)>
            <cfset arrayAppend(setClauses, "recordname = ?")>
        </cfif>

        <!--- If no fields to update, return false --->
        <cfif arrayLen(setClauses) eq 0>
            <cfreturn false>
        </cfif>

        <!--- Construct the SQL statement --->
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE networkid = ?">

        <!--- Execute the query --->
        <cfquery datasource="#DSN#">
            #sql#
            <cfif len(arguments.network)>
                <cfqueryparam value="#arguments.network#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif isNumeric(arguments.audCatid)>
                <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif isBoolean(arguments.isDeleted)>
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            </cfif>
            <cfif len(arguments.recordname)>
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfqueryparam value="#arguments.networkid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If query executes without error, return true --->
        <cfset result = true>

    <!--- Error handling and logging --->
    <cfcatch type="any">
        <cflog file="application" text="Error updating audnetworks: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        <!--- Return false if an error occurs --->
        <cfset result = false>
    </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected missing closing tag for cfcatch.
--->
</cfcomponent>
