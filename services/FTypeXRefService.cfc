<cfcomponent displayname="FTypeXRefService" hint="Handles operations for FTypeXRef table" output="false" > 
<cffunction name="getftypexref" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var sql = "SELECT ftypefull, ftype, updatetype, cfparam, IsDeleted, update_yn FROM ftypexref_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "ftypefull,ftype,updatetype,cfparam,IsDeleted,update_yn">
    <cfset var validOrderColumns = "ftypefull,ftype,updatetype,cfparam,IsDeleted,update_yn">
    <cfset var result = "">

    <cftry>
        <!--- Build dynamic WHERE clause based on filters --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
            </cfif>
        </cfloop>

        <!--- Append WHERE clause to SQL --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause if provided --->
        <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getftypexref: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">

        <!--- Return an empty query with correct schema on error --->
        <cfset result = queryNew("ftypefull, ftype, updatetype, cfparam, IsDeleted, update_yn", "varchar,varchar,varchar,varchar,bit,char")>
    </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct.
--->
</cfcomponent>
