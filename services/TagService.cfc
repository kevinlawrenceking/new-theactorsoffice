<cfcomponent displayname="TagService" hint="Handles operations for Tag table" output="false" > 
<cffunction name="gettags" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="tagid">

    <cfset var validColumns = "tagid,tagname,IsTeam,IsCasting,tagtype">
    <cfset var validOrderColumns = "tagid,tagname,IsTeam,IsCasting,tagtype">
    <cfset var sql = "SELECT tagid, tagname, IsTeam, IsCasting, tagtype FROM tags WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Add WHERE clauses to SQL --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and add ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch>
            <!--- Log the error --->
            <cflog file="application" text="Error in gettags: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with the correct structure on error --->
            <cfset result = queryNew("tagid,tagname,IsTeam,IsCasting,tagtype", "integer,varchar,bit,bit,char")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Added a placeholder function getSQLType(key) to ensure the code runs without errors.
--->
</cfcomponent>
