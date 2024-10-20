<cfcomponent displayname="ExportService" hint="Handles operations for Export table" output="false" > 
<cffunction name="insertexports" access="public" returntype="numeric">
    <cfargument name="userid" type="numeric" required="false">
    <cfargument name="exportStatus" type="string" required="false">

    <cfset var sql = "INSERT INTO exports (userid, export_timestamp, exportStatus) VALUES (?, ?, ?)">
    <cfset var result = 0>

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            #sql#
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.userid)#">
            <cfqueryparam value="#now()#" cfsqltype="CF_SQL_TIMESTAMP">
            <cfqueryparam value="#arguments.exportStatus#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.exportStatus)#">
        </cfquery>
        <cfset result = insertResult.generatedKey>
        <cfcatch>
            <cflog file="application" text="Error inserting into exports: #cfcatch.message# - #cfcatch.detail#">
            <cfset result = 0>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The function code is syntactically correct.
--->

<cffunction name="updateexports" access="public" returntype="boolean">
    <cfargument name="exportid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="false" default="">
    <cfargument name="exportStatus" type="string" required="false" default="">
    <cfargument name="export_timestamp" type="date" required="false" default="">
    
    <cfset var sql = "UPDATE `exports` SET">
    <cfset var setClauses = []>
    <cfset var result = false>

    <!--- Build SET clause dynamically based on provided arguments --->
    <cfif structKeyExists(arguments, "userid") and len(trim(arguments.userid))>
        <cfset arrayAppend(setClauses, "`userid` = ?")>
    </cfif>
    
    <cfif structKeyExists(arguments, "exportStatus") and len(trim(arguments.exportStatus))>
        <cfset arrayAppend(setClauses, "`exportStatus` = ?")>
    </cfif>
    
    <cfif structKeyExists(arguments, "export_timestamp") and len(trim(arguments.export_timestamp))>
        <cfset arrayAppend(setClauses, "`export_timestamp` = ?")>
    </cfif>

    <!--- If no fields to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Complete SQL statement --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE `exportid` = ?">

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfif structKeyExists(arguments, "userid") and len(trim(arguments.userid))>
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.userid)#">
            </cfif>

            <cfif structKeyExists(arguments, "exportStatus") and len(trim(arguments.exportStatus))>
                <cfqueryparam value="#arguments.exportStatus#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.exportStatus)#">
            </cfif>

            <cfif structKeyExists(arguments, "export_timestamp") and len(trim(arguments.export_timestamp))>
                <cfqueryparam value="#arguments.export_timestamp#" cfsqltype="CF_SQL_TIMESTAMP" null="#isNull(arguments.export_timestamp)#">
            </cfif>

            <!--- exportid is always required --->
            <cfqueryparam value="#arguments.exportid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If query executes without error, set result to true --->
        <cfset result = true>

        <!--- Catch any errors during query execution --->
        <cfcatch type="any">
            <cflog file="application" text="Error updating exports: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
        </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The code was correct as provided.
--->
</cfcomponent>
