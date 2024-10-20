<cfcomponent displayname="AuditionSourceService" hint="Handles operations for AuditionSource table" output="false" > 
<cffunction name="insertaudsources" access="public" returntype="numeric">
    <cfargument name="audsource" type="string" required="true">
    <cfargument name="recordname" type="string" required="false" default="">
    
    <cfset var insertResult = 0>
    <cfset var sql = "">
    
    <cftry>
        <cfset sql = "
            INSERT INTO audsources (audsource, isDeleted, recordname) 
            VALUES (?, ?, ?)
        ">
        
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            #sql#
            <cfqueryparam value="#arguments.audsource#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
        </cfquery>
        
        <cfset insertResult = result.generatedKey>
        
        <cfcatch type="any">
            <cflog file="application" type="error"
                text="Error in insertaudsources: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>
    
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- None. The function code is syntactically correct.
--->

<cffunction name="getaudsources" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="audsourceid">
    
    <cfset var validColumns = "audsourceid,audsource,recordname,isDeleted">
    <cfset var validOrderColumns = "audsourceid,audsource,recordname,isDeleted">
    <cfset var sql = "SELECT audsourceid, audsource, recordname, isDeleted FROM audsources WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfif not isNull(arguments.filters[key])>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <!--- Corrected the cfsqltype assignment to use a valid SQL type --->
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype="CF_SQL_VARCHAR"})>
            </cfif>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

        <!--- Handle errors and log them --->
        <cfcatch type="any">
            <cflog text="Error in getaudsources: #cfcatch.message#. Details: #cfcatch.detail#. Query: #sql#" type="error">
            <!--- Return an empty query with the correct schema on error --->
            <cfset result = queryNew("audsourceid,audsource,recordname,isDeleted", "integer,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Corrected the cfsqltype assignment in the queryParams array to use a valid SQL type ("CF_SQL_VARCHAR").
--->

<cffunction name="updateaudsources" access="public" returntype="boolean">
    <cfargument name="audsourceid" type="numeric" required="true">
    <cfargument name="audsource" type="string" required="false">
    <cfargument name="recordname" type="string" required="false">
    <cfargument name="isDeleted" type="boolean" required="false">

    <cfset var sql = "UPDATE audsources SET">
    <cfset var setClauses = []>
    <cfset var result = false>

    <!--- Build the SET clause dynamically based on provided arguments --->
    <cfif structKeyExists(arguments, "audsource")>
        <cfset arrayAppend(setClauses, "audsource = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "recordname")>
        <cfset arrayAppend(setClauses, "recordname = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "isDeleted")>
        <cfset arrayAppend(setClauses, "isDeleted = ?")>
    </cfif>

    <!--- If there are no fields to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Construct the final SQL statement --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE audsourceid = ?">

    <!--- Execute the query within a try/catch block for error handling --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfif structKeyExists(arguments, "audsource")>
                <cfqueryparam value="#arguments.audsource#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif structKeyExists(arguments, "recordname")>
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#not len(arguments.recordname)#">
            </cfif>
            <cfif structKeyExists(arguments, "isDeleted")>
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            </cfif>
            <cfqueryparam value="#arguments.audsourceid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If query executes without error, set result to true --->
        <cfset result = true>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error updating audsources: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Optionally handle the error further or rethrow --->
        </cfcatch>
    </cftry>

    <!--- Return the result of the update operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The function code is syntactically correct and should execute properly.
--->
</cfcomponent>
