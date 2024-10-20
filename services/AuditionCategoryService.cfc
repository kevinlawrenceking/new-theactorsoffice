<cfcomponent displayname="AuditionCategoryService" hint="Handles operations for AuditionCategory table" output="false" > 
<cffunction name="updateaudcategories" access="public" returntype="boolean">
    <cfargument name="audCatId" type="numeric" required="true">
    <cfargument name="audCatName" type="string" required="false" default="">
    <cfargument name="recordname" type="string" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>
    
    <cfset var sql = "UPDATE audcategories SET">
    <cfset var setClauses = []>
    <cfset var result = false>

    <!--- Build SET clauses dynamically based on provided arguments --->
    <cfif len(arguments.audCatName)>
        <cfset arrayAppend(setClauses, "audCatName = ?")>
    </cfif>
    <cfif len(arguments.recordname)>
        <cfset arrayAppend(setClauses, "recordname = ?")>
    </cfif>
    <cfif structKeyExists(arguments, "isDeleted")>
        <cfset arrayAppend(setClauses, "isDeleted = ?")>
    </cfif>

    <!--- If no fields to update, return false --->
    <cfif arrayLen(setClauses) eq 0>
        <cfreturn false>
    </cfif>

    <!--- Construct the SQL query --->
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE audCatId = ?">

    <!--- Try to execute the query and handle errors --->
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfif len(arguments.audCatName)>
                <cfqueryparam value="#arguments.audCatName#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif len(arguments.recordname)>
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
            <cfif structKeyExists(arguments, "isDeleted")>
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            </cfif>
            <cfqueryparam value="#arguments.audCatId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If no error occurs, set result to true --->
        <cfset result = true>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error updating audcategories: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
        </cfcatch>
    </cftry>

    <!--- Return the result of the update operation --->
    <cfreturn result>
</cffunction>
<cffunction name="getvm_audcategories_audsubcategories" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="audcatid">
    <cfset var result = "">
    <cfset var sql = "SELECT audcatid, audcatname, audsubcatid, audsubcatname, isdeleted FROM vm_audcategories_audsubcategories WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "audcatid,audcatname,audsubcatid,audsubcatname,isdeleted">
    <cfset var validOrderBy = "audcatid,audsubcatid,audcatname,audsubcatname,isdeleted">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause with validation --->
    <cfif listFindNoCase(validOrderBy, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#evaluate('CF_SQL_' & uCase(getColumnType(key)))#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getvm_audcategories_audsubcategories: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset result = queryNew("audcatid,audcatname,audsubcatid,audsubcatname,isdeleted", "integer,varchar,integer,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction></cfcomponent>
