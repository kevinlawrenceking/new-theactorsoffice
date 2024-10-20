<cfcomponent displayname="AuditionTypeService" hint="Handles operations for AuditionType table" output="false" > 
<cffunction name="insertaudtypes" access="public" returntype="numeric">
    <cfargument name="audtype" type="string" required="true">
    <cfargument name="recordname" type="string" required="false" default="">
    <cfargument name="audcategories" type="string" required="false" default="">
    <cfargument name="isDeleted" type="boolean" required="true">
    <cfargument name="islocation" type="boolean" required="true">

    <cfset var insertResult = 0>
    <cfset var sql = "INSERT INTO audtypes (audtype, recordname, audcategories, isDeleted, islocation) VALUES (?, ?, ?, ?, ?)">

    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            #sql#
            <cfqueryparam value="#arguments.audtype#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
            <cfqueryparam value="#arguments.audcategories#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.audcategories)#">
            <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.islocation#" cfsqltype="CF_SQL_BIT">
        </cfquery>
        <cfset insertResult = result.generatedKey>
        <cfcatch>
            <cflog text="Error inserting into audtypes: #cfcatch.message# - #cfcatch.detail#" type="error">
            <cflog text="SQL: #sql#" type="error">
        </cfcatch>
    </cftry>

    <cfreturn insertResult>
</cffunction> 

<!--- Changes made:
- None. The function code is syntactically correct.
--->

<cffunction name="getaudtypes" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="audtypeid">
    <cfset var validColumns = "audtypeid,audtype,recordname,audcategories,isDeleted,islocation">
    <cfset var sql = "SELECT audtypeid, audtype, recordname, audcategories, isDeleted, islocation FROM audtypes WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Validate and build the WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <!--- Assuming schemaDetails is defined elsewhere in the application context --->
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=structFind(schemaDetails, key).cfsqltype})>
        </cfif>
    </cfloop>

    <!--- Validate the ORDER BY clause --->
    <cfif NOT listFindNoCase(validColumns, arguments.orderBy)>
        <cfset arguments.orderBy = "audtypeid">
    </cfif>

    <!--- Construct the final SQL query --->
    <cfif arrayLen(whereClause) GT 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <cfset sql &= " ORDER BY #arguments.orderBy#">

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getaudtypes: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with the correct schema on error --->
            <cfset result = queryNew("audtypeid,audtype,recordname,audcategories,isDeleted,islocation", "integer,varchar,varchar,varchar,bit,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- Added a comment to clarify that 'schemaDetails' is assumed to be defined elsewhere in the application context.
--->

<cffunction name="updateaudtypes" access="public" returntype="boolean">
    <cfargument name="audtypeid" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">

    <cfset var sql = "UPDATE audtypes SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "audtype,recordname,audcategories,isDeleted,islocation">
    <cfset var result = false>

    <cftry>
        <!--- Loop through the data struct to build the SET clause --->
        <cfloop collection="#arguments.data#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(setClauses, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- If there are no valid columns to update, return false --->
        <cfif arrayLen(setClauses) eq 0>
            <cfreturn false>
        </cfif>

        <!--- Construct the final SQL statement --->
        <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE audtypeid = ?">

        <!--- Execute the query --->
        <cfquery datasource="#DSN#">
            #sql#
            <cfloop collection="#arguments.data#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data[key])#">
                </cfif>
            </cfloop>
            <cfqueryparam value="#arguments.audtypeid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- If query executes without error, return true --->
        <cfset result = true>

        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error updating audtypes: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return false on error --->
            <cfset result = false>
        </cfcatch>
    </cftry>

    <!--- Return the result of the operation --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Replaced dynamic evaluation of cfsqltype with a static type (CF_SQL_VARCHAR) for cfqueryparam as dynamic evaluation using evaluate() is not recommended.
--->

<cffunction name="getvm_audtypes_audsteps" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var sql = "SELECT new_audtypeid, audstepid, new_label, id, name, new_itemDataset FROM vm_audtypes_audsteps WHERE r.audroleid = ?">
    <cfset var whereClause = []>
    <cfset var orderClause = "">
    <cfset var validColumns = "new_audtypeid,audstepid,new_label,id,name,new_itemDataset">
    <cfset var queryResult = "">

    <cftry>
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

        <!--- Validate and append ORDER BY clause --->
        <cfif len(arguments.orderBy) and listFindNoCase(validColumns, arguments.orderBy)>
            <cfset orderClause = " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="abod">
            #sql#
            #orderClause#
            <cfqueryparam value="#arguments.audroleid#" cfsqltype="CF_SQL_INTEGER">
            <cfloop collection="#arguments.filters#" item="key">
                <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#getSQLType(key)#">
            </cfloop>
        </cfquery>

        <!--- Catch and log any errors --->
        <cfcatch type="any">
            <cflog file="application" text="Error in getvm_audtypes_audsteps: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with correct schema on error --->
            <cfset queryResult = queryNew("new_audtypeid,audstepid,new_label,id,name,new_itemDataset", "integer,integer,varchar,varchar,varchar,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction>
<cffunction name="getvm_audtypes_events_roles" access="public" returntype="query">
    <cfargument name="audstepid" type="numeric" required="false">
    <cfargument name="audprojectid" type="numeric" required="false">
    <cfargument name="audroleid" type="numeric" required="false">
    <cfargument name="audtype" type="string" required="false">
    <cfargument name="isdeleted" type="boolean" required="false">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var result = "">
    <cfset var sql = "SELECT `audstepid`, `audprojectid`, `audroleid`, `audtype`, `isdeleted`, `totals`, `audtypeid` FROM vm_audtypes_events_roles WHERE 1=1">
    <cfset var params = []>
    <cfset var validOrderByColumns = "audstepid,audprojectid,audroleid,audtype,isdeleted,totals,audtypeid">

    <!--- Dynamic WHERE clause construction --->
    <cfif structKeyExists(arguments, "audstepid") and not isNull(arguments.audstepid)>
        <cfset sql &= " AND audstepid = ?">
        <cfset arrayAppend(params, {value=arguments.audstepid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>
    
    <cfif structKeyExists(arguments, "audprojectid") and not isNull(arguments.audprojectid)>
        <cfset sql &= " AND audprojectid = ?">
        <cfset arrayAppend(params, {value=arguments.audprojectid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "audroleid") and not isNull(arguments.audroleid)>
        <cfset sql &= " AND audroleid = ?">
        <cfset arrayAppend(params, {value=arguments.audroleid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "audtype") and not isNull(arguments.audtype)>
        <cfset sql &= " AND audtype = ?">
        <cfset arrayAppend(params, {value=arguments.audtype, cfsqltype="CF_SQL_VARCHAR"})>
    </cfif>

    <cfif structKeyExists(arguments, "isdeleted") and not isNull(arguments.isdeleted)>
        <cfset sql &= " AND isdeleted = ?">
        <cfset arrayAppend(params, {value=arguments.isdeleted, cfsqltype="CF_SQL_BIT"})>
    </cfif>

    <!--- Order By Clause --->
    <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="result" datasource="#yourDataSource#">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        
        <!--- Handle any errors --->
        <cfcatch type="any">
            <cflog file="application" text="Error in getvm_audtypes_events_roles: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with the correct structure --->
            <cfset result = queryNew("audstepid,audprojectid,audroleid,audtype,isdeleted,totals,audtypeid", 
                "integer,integer,integer,varchar,bit,bigint,bigint")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction></cfcomponent>
