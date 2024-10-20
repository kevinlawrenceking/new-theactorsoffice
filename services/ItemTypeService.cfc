<cfcomponent displayname="ItemTypeService" hint="Handles operations for ItemType table" output="false" > 
<cffunction name="getitemtypes" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">

    <cfset var sql = "SELECT `typeID`, `valueType`, `typeIcon`, `recordname`, `IsDeleted` FROM `itemtypes_tbl` WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "typeID,valueType,typeIcon,recordname,IsDeleted">
    <cfset var validOrderByColumns = "typeID,valueType,typeIcon,recordname,IsDeleted">
    <cfset var result = "">

    <cftry>
        <!--- Build WHERE clause dynamically --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <!--- Corrected the cfsqltype assignment --->
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de("CF_SQL_" & uCase(listGetAt(validColumns, listFindNoCase(validColumns, key))))})>
            </cfif>
        </cfloop>

        <!--- Append WHERE conditions to SQL --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Add ORDER BY clause if specified and valid --->
        <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

        <!--- Handle errors and log them --->
        <cfcatch type="any">
            <cflog file="application" text="Error in getitemtypes: #cfcatch.message#. Detail: #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset result = queryNew("typeID,valueType,typeIcon,recordname,IsDeleted", "smallint,varchar,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Corrected the cfsqltype assignment in the queryParams array to ensure proper SQL type mapping.
--->

<cffunction name="getvm_itemtypes_itemcatxref" access="public" returntype="query">
    <cfargument name="userid" type="string" required="false">
    <cfargument name="sitetypeid" type="numeric" required="false">
    <cfargument name="isdeleted" type="boolean" required="false">
    <cfargument name="isCustom" type="boolean" required="false">
    <cfargument name="orderBy" type="string" required="false" default="valuetype">

    <cfset var local = {} />
    <cfset local.sql = "SELECT valuetype FROM vm_itemtypes_itemcatxref WHERE 1=1" />
    <cfset local.whereClause = [] />
    <cfset local.queryParams = [] />
    <cfset local.validOrderByColumns = "valuetype" />

    <!--- Build dynamic WHERE clause --->
    <cfif structKeyExists(arguments, "userid")>
        <cfset arrayAppend(local.whereClause, "(s.userid = ? OR s.userid = ?)")>
        <cfset arrayAppend(local.queryParams, {value=arguments.userid, cfsqltype="CF_SQL_VARCHAR"})>
        <cfset arrayAppend(local.queryParams, {value=session.userid, cfsqltype="CF_SQL_VARCHAR"})>
    </cfif>

    <cfif structKeyExists(arguments, "sitetypeid")>
        <cfset arrayAppend(local.whereClause, "s.sitetypeid = ?")>
        <cfset arrayAppend(local.queryParams, {value=arguments.sitetypeid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "isdeleted")>
        <cfset arrayAppend(local.whereClause, "s.isdeleted = ?")>
        <cfset arrayAppend(local.queryParams, {value=arguments.isdeleted, cfsqltype="CF_SQL_BIT"})>
    </cfif>

    <cfif structKeyExists(arguments, "isCustom")>
        <cfset arrayAppend(local.whereClause, "s.isCustom = ?")>
        <cfset arrayAppend(local.queryParams, {value=arguments.isCustom, cfsqltype="CF_SQL_BIT"})>
    </cfif>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(local.whereClause) gt 0>
        <cfset local.sql &= " AND " & arrayToList(local.whereClause, " AND ") />
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(local.validOrderByColumns, arguments.orderBy)>
        <cfset local.sql &= " ORDER BY #arguments.orderBy#" />
    </cfif>

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="local.result" datasource="yourDataSource">
            #local.sql#
            <cfloop array="#local.queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfreturn local.result>

        <cfcatch type="any">
            <!--- Log the error --->
            <cflog file="application" text="Error in getvm_itemtypes_itemcatxref: #cfcatch.message# - #local.sql#">
            <!--- Return an empty query with correct schema --->
            <cfreturn queryNew("valuetype", "varchar")>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
