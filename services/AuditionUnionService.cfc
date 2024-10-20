<cfcomponent displayname="AuditionUnionService" hint="Handles operations for AuditionUnion table" output="false" > 
<cffunction name="insertaudunions" access="public" returntype="numeric">
    <cfargument name="unionID" type="numeric" required="true">
    <cfargument name="unionName" type="string" required="true">
    <cfargument name="countryid" type="string" required="false" default="">
    <cfargument name="audCatID" type="numeric" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="recordname" type="string" required="false" default="">
    
    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#application.dsn#" result="queryResult">
            INSERT INTO audunions (unionID, unionName, countryid, audCatID, isDeleted, recordname)
            VALUES (
                <cfqueryparam value="#arguments.unionID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.unionName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.countryid#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.countryid)#">,
                <cfqueryparam value="#arguments.audCatID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
            )
        </cfquery>
        
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into audunions: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL: INSERT INTO audunions (unionID, unionName, countryid, audCatID, isDeleted, recordname) VALUES (?, ?, ?, ?, ?, ?)">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>
    
    <cfreturn insertResult>
</cffunction>
<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="getaudunions" access="public" returntype="query">
    <cfargument name="new_countryid" type="string" required="false" default="">
    <cfargument name="new_audcatid" type="numeric" required="false" default="0">
    
    <cfset var result = "">
    <cfset var sql = "SELECT ID, NAME, countryid, audcatid FROM vm_audunions_countries WHERE isDeleted IS FALSE"> <!--- Removed 'u.' prefix from 'isDeleted' --->
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    
    <!--- Build dynamic WHERE clause --->
    <cfif len(trim(arguments.new_countryid))>
        <cfset arrayAppend(whereClause, "countryid = ?")>
        <cfset arrayAppend(queryParams, {value=arguments.new_countryid, cfsqltype="CF_SQL_CHAR"})>
    </cfif>
    
    <cfif arguments.new_audcatid neq 0>
        <cfset arrayAppend(whereClause, "audcatid = ?")>
        <cfset arrayAppend(queryParams, {value=arguments.new_audcatid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(whereClause)>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfset sql &= " ORDER BY NAME">

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing getaudunions: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with correct schema on error --->
            <cfset result = queryNew("ID, NAME, countryid, audcatid", "integer,varchar,char,integer")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Removed 'u.' prefix from 'isDeleted' in the SQL statement to match the table structure.
--->

<cffunction name="updateaudunions" access="public" returntype="boolean">
    <cfargument name="unionID" type="numeric" required="true">
    <cfargument name="unionName" type="string" required="false">
    <cfargument name="countryid" type="string" required="false">
    <cfargument name="audCatID" type="numeric" required="false">
    <cfargument name="isDeleted" type="boolean" required="false">
    <cfargument name="recordname" type="string" required="false">

    <cfset var sql = "UPDATE audunions SET ">
    <cfset var setClauses = []>
    <cfset var result = false>

    <!--- Build the SET clause dynamically --->
    <cfif structKeyExists(arguments, "unionName")>
        <cfset arrayAppend(setClauses, "unionName = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "countryid")>
        <cfset arrayAppend(setClauses, "countryid = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "audCatID")>
        <cfset arrayAppend(setClauses, "audCatID = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "isDeleted")>
        <cfset arrayAppend(setClauses, "isDeleted = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "recordname")>
        <cfset arrayAppend(setClauses, "recordname = ?")>
    </cfif>

    <!--- If no fields to update are provided, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Construct the final SQL statement --->
    <cfset sql &= arrayToList(setClauses, ", ") & " WHERE unionID = ?">

    <!--- Try to execute the query and handle any potential errors --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <!--- Bind parameters for SET clause --->
            <cfif structKeyExists(arguments, "unionName")>
                <cfqueryparam value="#arguments.unionName#" cfsqltype="CF_SQL_VARCHAR" null="#not len(arguments.unionName)#">
            </cfif>
            <cfif structKeyExists(arguments, "countryid")>
                <cfqueryparam value="#arguments.countryid#" cfsqltype="CF_SQL_CHAR" null="#not len(arguments.countryid)#">
            </cfif>
            <cfif structKeyExists(arguments, "audCatID")>
                <cfqueryparam value="#arguments.audCatID#" cfsqltype="CF_SQL_INTEGER" null="#not isNumeric(arguments.audCatID)#">
            </cfif>
            <cfif structKeyExists(arguments, "isDeleted")>
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            </cfif>
            <cfif structKeyExists(arguments, "recordname")>
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#not len(arguments.recordname)#">
            </cfif>

            <!--- Bind parameter for WHERE clause --->
            <cfqueryparam value="#arguments.unionID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If query executes successfully, return true --->
        <cfset result = true>

        <!--- Error handling and logging --->
        <cfcatch type="any">
            <cflog file="application" text="Error updating audunions: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return false on error --->
            <cfset result = false>
        </cfcatch>

    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>

</cffunction> 

<!--- Changes made:
- Added missing closing tag for cftry.
--->
</cfcomponent>
