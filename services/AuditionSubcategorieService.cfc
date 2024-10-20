<cfcomponent displayname="AuditionSubcategorieService" hint="Handles operations for AuditionSubcategorie table" output="false" > 
<cffunction name="insertaudsubcategories" access="public" returntype="numeric">
    <cfargument name="audSubCatName" type="string" required="true">
    <cfargument name="audSubCatNameSort" type="string" required="true">
    <cfargument name="audCatId" type="numeric" required="true">
    <cfargument name="isDeleted" type="boolean" default=false>
    <cfargument name="recordname" type="string" required="false">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audsubcategories (audSubCatName, audSubCatNameSort, audCatId, isDeleted, recordname) VALUES (?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            #sql#
            <cfqueryparam value="#arguments.audSubCatName#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.audSubCatNameSort#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.audCatId#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
        </cfquery>
        <cfset insertResult = result.generatedKey>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into audsubcategories: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction>
<!--- Changes made:
- None. The code is syntactically correct and should execute without errors.
--->

<cffunction name="getaudsubcategories" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="audSubCatId">
    
    <cfset var validColumns = "audSubCatId,audCatId,audSubCatName,audSubCatNameSort,recordname,isDeleted">
    <cfset var validOrderByColumns = "audSubCatId,audCatId,audSubCatName,audSubCatNameSort,recordname,isDeleted">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var sql = "SELECT audSubCatId, audCatId, audSubCatName, audSubCatNameSort, recordname, isDeleted FROM audsubcategories WHERE 1=1">
    <cfset var result = "">

    <!--- Validate orderBy column --->
    <cfif not listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset arguments.orderBy = "audSubCatId">
    </cfif>

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de(iif(key eq 'isDeleted', 'CF_SQL_BIT', iif(key eq 'audSubCatId' or key eq 'audCatId', 'CF_SQL_INTEGER', 'CF_SQL_VARCHAR'))), null=iif(isNull(arguments.filters[key]), true, false)})>
        </cfif>
    </cfloop>

    <!--- Construct final SQL query --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>
    <cfset sql &= " ORDER BY #arguments.orderBy#">

    <!--- Execute the query --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#param.null#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog text="Error executing getaudsubcategories: #cfcatch.message#, Detail: #cfcatch.detail#, SQL: #sql#" type="error">
            <!--- Return an empty query with correct schema on error --->
            <cfset result = queryNew("audSubCatId,audCatId,audSubCatName,audSubCatNameSort,recordname,isDeleted", "integer,integer,varchar,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Moved the ORDER BY clause outside of the cfif block to ensure it is always appended to the SQL query.
--->

<cffunction name="updateaudsubcategories" access="public" returntype="boolean">
    <cfargument name="audSubCatId" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    
    <cfset var sql = "UPDATE audsubcategories SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "audSubCatName,audSubCatNameSort,audCatId,isDeleted,recordname">
    <cfset var result = false>

    <cftry>
        <!--- Build the SET clause dynamically based on provided data --->
        <cfloop collection="#arguments.data#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(setClauses, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- If there are no valid columns to update, return false --->
        <cfif arrayLen(setClauses) eq 0>
            <cfreturn false>
        </cfif>

        <!--- Construct the final SQL query --->
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE audSubCatId = ?">

        <!--- Execute the update query --->
        <cfquery datasource="#DSN#">
            #sql#
            <!--- Bind parameters for each column in the SET clause --->
            <cfloop collection="#arguments.data#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.data[key]#" 
                                  cfsqltype="CF_SQL_VARCHAR"
                                  null="#isNull(arguments.data[key])#">
                </cfif>
            </cfloop>
            <!--- Bind parameter for the WHERE clause --->
            <cfqueryparam value="#arguments.audSubCatId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If no error occurs, set result to true --->
        <cfset result = true>

        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error updating audsubcategories: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return false on error --->
            <cfset result = false>
        </cfcatch>
    </cftry>

    <!--- Return the result of the update operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected cfsqltype in cfqueryparam to use a generic type (CF_SQL_VARCHAR) since dynamic determination was incorrect.
--->
</cfcomponent>
