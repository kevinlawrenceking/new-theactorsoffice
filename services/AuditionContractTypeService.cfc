<cfcomponent displayname="AuditionContractTypeService" hint="Handles operations for AuditionContractType table" output="false" > 
<cffunction name="insertaudcontracttypes" access="public" returntype="numeric">
    <cfargument name="contracttypeid" type="numeric" required="true">
    <cfargument name="contracttype" type="string" required="true">
    <cfargument name="audCatid" type="numeric" required="false" default="2">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>
    <cfargument name="recordname" type="string" required="false">

    <cfset var insertResult = 0>

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO audcontracttypes (
                contracttypeid, 
                contracttype, 
                audCatid, 
                isDeleted, 
                recordname
            ) VALUES (
                <cfqueryparam value="#arguments.contracttypeid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.contracttype#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
            )
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into audcontracttypes: #cfcatch.message# Details: #cfcatch.detail#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="updateaudcontracttypes" access="public" returntype="boolean">
    <cfargument name="contracttypeid" type="numeric" required="true">
    <cfargument name="contracttype" type="string" required="false">
    <cfargument name="audCatid" type="numeric" required="false">
    <cfargument name="isDeleted" type="boolean" required="false">
    <cfargument name="recordname" type="string" required="false">

    <cfset var sql = "UPDATE audcontracttypes SET">
    <cfset var setClauses = []>
    <cfset var result = false>

    <!--- Validate and build SET clauses --->
    <cfif structKeyExists(arguments, "contracttype")>
        <cfset arrayAppend(setClauses, "contracttype = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "audCatid")>
        <cfset arrayAppend(setClauses, "audCatid = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "isDeleted")>
        <cfset arrayAppend(setClauses, "isDeleted = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "recordname")>
        <cfset arrayAppend(setClauses, "recordname = ?")>
    </cfif>

    <!--- If no fields to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Construct the SQL query --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE contracttypeid = ?">

    <!--- Execute the query in a try/catch block for error handling --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <!--- Bind parameters securely using cfqueryparam --->
            <cfif structKeyExists(arguments, "contracttype")>
                <cfqueryparam value="#arguments.contracttype#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif structKeyExists(arguments, "audCatid")>
                <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif structKeyExists(arguments, "isDeleted")>
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            </cfif>
            <cfif structKeyExists(arguments, "recordname")>
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
            </cfif>

            <!--- WHERE clause parameter --->
            <cfqueryparam value="#arguments.contracttypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If no errors occurred, set result to true --->
        <cfset result = true>

        <!--- Error handling and logging --->
        <cfcatch type="any">
            <cflog file="application" text="Error updating audcontracttypes: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Added missing closing tag for cftry.
--->
</cfcomponent>
