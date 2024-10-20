<cfcomponent displayname="AuditionVocalTypeService" hint="Handles operations for AuditionVocalType table" output="false" > 
<cffunction name="insertaudvocaltypes" access="public" returntype="numeric">
    <cfargument name="vocaltypeid" type="numeric" required="true">
    <cfargument name="vocaltype" type="string" required="true">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="recordname" type="string" required="false" default="">
    
    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO audvocaltypes (vocaltypeid, vocaltype, isDeleted, recordname)
            VALUES (
                <cfqueryparam value="#arguments.vocaltypeid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.vocaltype#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#not len(arguments.recordname)#">
            )
        </cfquery>
        
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into audvocaltypes: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL Query: INSERT INTO audvocaltypes (vocaltypeid, vocaltype, isDeleted, recordname) VALUES (?, ?, ?, ?)">
        </cfcatch>
    </cftry>
    
    <cfreturn insertResult>
</cffunction> 
<!--- Changes made:
- Added missing closing tag for cfcatch.
--->

<cffunction name="getaudvocaltypes" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="vocaltypeid">
    
    <cfset var validColumns = "vocaltypeid,vocaltype,recordname,isDeleted">
    <cfset var validOrderColumns = "vocaltypeid,vocaltype,recordname,isDeleted">
    <cfset var sql = "SELECT vocaltypeid, vocaltype, recordname, isDeleted FROM audvocaltypes WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de(iif(key EQ 'isDeleted', 'CF_SQL_BIT', iif(key EQ 'vocaltypeid', 'CF_SQL_INTEGER', 'CF_SQL_VARCHAR'))), null=iif(isNull(arguments.filters[key]), true, false)})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL if conditions are present --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    <cfelse>
        <!--- Return empty query if no filters are provided --->
        <cfreturn queryNew("vocaltypeid,vocaltype,recordname,isDeleted", "integer,varchar,varchar,bit")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#param.null#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getaudvocaltypes: #cfcatch.message#; Detail: #cfcatch.detail#; SQL: #sql#">
            <!--- Return an empty query on error --->
            <cfreturn queryNew("vocaltypeid,vocaltype,recordname,isDeleted", "integer,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result set --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="updateaudvocaltypes" access="public" returntype="boolean">
    <cfargument name="vocaltypeid" type="numeric" required="true">
    <cfargument name="vocaltype" type="string" required="false">
    <cfargument name="recordname" type="string" required="false">
    <cfargument name="isDeleted" type="boolean" required="false">

    <cfset var sql = "UPDATE audvocaltypes SET">
    <cfset var setClauses = []>
    <cfset var result = false>

    <!--- Build the SET clause dynamically based on provided arguments --->
    <cfif structKeyExists(arguments, "vocaltype")>
        <cfset arrayAppend(setClauses, "vocaltype = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "recordname")>
        <cfset arrayAppend(setClauses, "recordname = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "isDeleted")>
        <cfset arrayAppend(setClauses, "isDeleted = ?")>
    </cfif>

    <!--- If there are no fields to update, return false --->
    <cfif arrayLen(setClauses) EQ 0>
        <cfreturn false>
    </cfif>

    <!--- Construct the final SQL statement --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE vocaltypeid = ?">

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfif structKeyExists(arguments, "vocaltype")>
                <cfqueryparam value="#arguments.vocaltype#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif structKeyExists(arguments, "recordname")>
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif structKeyExists(arguments, "isDeleted")>
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            </cfif>
            <cfqueryparam value="#arguments.vocaltypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If the query executes successfully, set result to true --->
        <cfset result = true>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error updating audvocaltypes: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        </cfcatch>
    </cftry>

    <!--- Return the result of the update operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- No syntax errors found; code is correct as is.
--->
</cfcomponent>
