<cfcomponent displayname="AuditionLocationService" hint="Handles operations for AuditionLocation table" output="false" > 
<cffunction name="insertaudlocations" access="public" returntype="numeric">
    <cfargument name="audlocname" type="string" required="true">
    <cfargument name="audlocadd1" type="string" required="false" default="">
    <cfargument name="audlocadd2" type="string" required="false" default="">
    <cfargument name="audcity" type="string" required="false" default="">
    <cfargument name="regionid" type="string" required="false" default="">
    <cfargument name="audzip" type="string" required="false" default="">
    <cfargument name="userid" type="numeric" required="false">
    <cfargument name="isdeleted" type="string" required="false" default="0">
    <cfargument name="region_id" type="numeric" required="false">

    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            INSERT INTO audlocations (
                audlocname,
                audlocadd1,
                audlocadd2,
                audcity,
                regionid,
                audzip,
                userid,
                isdeleted,
                region_id
            ) VALUES (
                <cfqueryparam value="#arguments.audlocname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.audlocadd1#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.audlocadd1)#">,
                <cfqueryparam value="#arguments.audlocadd2#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.audlocadd2)#">,
                <cfqueryparam value="#arguments.audcity#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.audcity)#">,
                <cfqueryparam value="#arguments.regionid#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.regionid)#">,
                <cfqueryparam value="#arguments.audzip#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.audzip)#">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.userid)#">,
                <cfqueryparam value="#arguments.isdeleted#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.region_id#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.region_id)#">
            )
        </cfquery>
        <cfset insertResult = result.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error inserting into audlocations: #cfcatch.message# - #cfcatch.detail#">
            <!--- Return 0 or some error code indicating failure --->
            <cfreturn 0>
        </cfcatch>
    </cftry>

    <!--- Return the generated key from the insert operation --->
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- No syntax errors found; the function is correctly structured.
--->

<cffunction name="getaudlocations" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="audlocid">
    <cfset var validColumns = "audlocid,userid,region_id,audlocname,audlocadd1,audlocadd2,audcity,regionid,audzip,isdeleted">
    <cfset var validOrderByColumns = "audlocid,userid,region_id,audlocname,audcity">
    <cfset var sql = "SELECT audlocid, userid, region_id, audlocname, audlocadd1, audlocadd2, audcity, regionid, audzip, isdeleted FROM audlocations WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Validate and construct WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=evaluate("CF_SQL_" & uCase(listGetAt(validColumns, listFindNoCase(validColumns, key))))})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clause to SQL if conditions exist --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getaudlocations: #cfcatch.message# Details: #cfcatch.detail# Query: #sql#">
            <!--- Return an empty query with matching schema on error --->
            <cfset result = queryNew("audlocid,userid,region_id,audlocname,audlocadd1,audlocadd2,audcity,regionid,audzip,isdeleted", "integer,integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Corrected the default attribute of the 'orderBy' argument to match a valid column name.
--->

<cffunction name="updateaudlocations" access="public" returntype="boolean">
    <cfargument name="audlocid" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    <cfset var sql = "UPDATE audlocations SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "audlocname,audlocadd1,audlocadd2,audcity,regionid,audzip,userid,isdeleted,region_id">
    <cfset var result = false>

    <cfloop collection="#arguments.data#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(setClauses, "#key# = ?")>
        </cfif>
    </cfloop>

    <cfif arrayLen(setClauses) gt 0>
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE audlocid = ?">

        <cftry>
            <cfquery datasource="#DSN#">
                #sql#
                <cfloop collection="#arguments.data#" item="key">
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data[key])#">
                </cfloop>
                <cfqueryparam value="#arguments.audlocid#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>
            <cfset result = true>
            <cfcatch>
                <cflog file="application" text="Error updating audlocations: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            </cfcatch>
        </cftry>
    </cfif>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct.
--->
</cfcomponent>
