<cfcomponent displayname="ItemCategoryService" hint="Handles operations for ItemCategory table" output="false" > 
<cffunction name="getitemcategory" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="catID">

    <cfset var validColumns = "catID,catOrder,valueCategory,catIcon,valueTypeDef,catFieldSet,recordname,IsDeleted,catArea_UCB,catSelectList">
    <cfset var validOrderColumns = "catID,catOrder,valueCategory,recordname">
    <cfset var sql = "SELECT catID, catOrder, valueCategory, catIcon, valueTypeDef, catFieldSet, recordname, IsDeleted, catArea_UCB, catSelectList FROM itemcategory_tbl WHERE 1=1">
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

    <!--- Add WHERE clauses if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getitemcategory: #cfcatch.message#, Detail: #cfcatch.detail#, SQL: #sql#">
            <!--- Return an empty query with the correct structure --->
            <cfset result = queryNew("catID, catOrder, valueCategory, catIcon, valueTypeDef, catFieldSet, recordname, IsDeleted, catArea_UCB, catSelectList", "integer, integer, varchar, varchar, varchar, varchar, varchar, bit, char, longvarchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="getvm_itemcategory_itemtypes" access="public" returntype="query">
    <cfargument name="catid" type="numeric" required="false">
    <cfargument name="valuetype" type="string" required="false">
    <cfargument name="orderBy" type="string" required="false" default="catid">

    <cfset var result = "">
    <cfset var sql = "SELECT catid, valuetype FROM vm_itemcategory_itemtypes WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "catid,valuetype">
    <cfset var validOrderByColumns = "catid,valuetype">

    <!--- Build dynamic WHERE clause --->
    <cfif structKeyExists(arguments, "catid") and not isNull(arguments.catid)>
        <cfset arrayAppend(whereClause, "catid = ?")>
    </cfif>
    
    <cfif structKeyExists(arguments, "valuetype") and not isNull(arguments.valuetype)>
        <cfset arrayAppend(whereClause, "valuetype = ?")>
    </cfif>

    <!--- Append WHERE clause if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    <else>
        <!--- Return an empty query if no conditions are provided --->
        <cfreturn queryNew("catid,valuetype", "integer,varchar")>
    </cfif>

    <!--- Validate ORDER BY column --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="result" datasource="yourDatasource">
            #sql#
            <!--- Bind parameters securely --->
            <cfif structKeyExists(arguments, "catid") and not isNull(arguments.catid)>
                <cfqueryparam value="#arguments.catid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
            <cfif structKeyExists(arguments, "valuetype") and not isNull(arguments.valuetype)>
                <cfqueryparam value="#arguments.valuetype#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
        </cfquery>

        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getvm_itemcategory_itemtypes: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query on error --->
            <cfreturn queryNew("catid,valuetype", "integer,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result set --->
    <cfreturn result>
</cffunction>
<cffunction name="getvm_itemcategory_catdetails" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="catID">
    <cfset var validColumns = "catID,catOrder,valuecategory,catIcon,valuetypedef,catFieldSet,catSelectList">
    <cfset var validOrderColumns = "catID,catOrder,valuecategory,catIcon,valuetypedef,catFieldSet">
    <cfset var sql = "SELECT catID, catOrder, valuecategory, catIcon, valuetypedef, catFieldSet, catSelectList FROM vm_itemcategory_catdetails WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Validate and construct WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=determineSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Add WHERE clauses to SQL if any --->
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
            <!--- Log error details --->
            <cflog file="application" text="Error in getvm_itemcategory_catdetails: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with correct schema --->
            <cfset result = queryNew("catID,catOrder,valuecategory,catIcon,valuetypedef,catFieldSet,catSelectList", "integer,integer,varchar,varchar,varchar,varchar,longvarchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>

</cffunction></cfcomponent>
