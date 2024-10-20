<cfcomponent displayname="SystemService" hint="Handles operations for System table" output="false" > 
<cffunction name="getfusystems" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="systemID">
    <cfset var local = {}>

    <!--- Define a whitelist of valid columns for WHERE and ORDER BY clauses --->
    <cfset local.validColumns = "systemID,systemName,SystemType,SystemScope,SystemDescript,SystemTriggerNote,recordname,IsDeleted">

    <!--- Initialize the SQL query --->
    <cfset local.sql = "
        SELECT 
            systemID, 
            systemName, 
            SystemType, 
            SystemScope, 
            SystemDescript, 
            SystemTriggerNote, 
            recordname, 
            IsDeleted
        FROM fusystems_tbl
        WHERE 1=1">

    <!--- Initialize an array to hold the WHERE clause conditions --->
    <cfset local.whereClause = []>
    <cfset local.queryParams = []>

    <!--- Build dynamic WHERE clause based on provided filters --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(local.validColumns, key)>
            <cfset arrayAppend(local.whereClause, "#key# = ?")>
            <cfset arrayAppend(local.queryParams, {value=arguments.filters[key], cfsqltype=local.getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Append WHERE conditions to the SQL query --->
    <cfif arrayLen(local.whereClause) gt 0>
        <cfset local.sql &= " AND " & arrayToList(local.whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(local.validColumns, arguments.orderBy)>
        <cfset local.sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="local.result" datasource="yourDataSource">
            #local.sql#
            <cfloop array="#local.queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfreturn local.result>
        
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getfusystems: #cfcatch.message# Details: #cfcatch.detail# Query: #local.sql#">
            
            <!--- Return an empty query with matching schema on error --->
            <cfreturn queryNew("systemID,systemName,SystemType,SystemScope,SystemDescript,SystemTriggerNote,recordname,IsDeleted", "integer,varchar,varchar,varchar,varchar,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

</cffunction> 

<!--- Changes made:
- Added missing function to define 'local.getSQLType' to avoid errors.
--->

<cffunction name="getvm_fusystems_fuactions_actionusers" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var sql = "SELECT `systemID`, `systemName`, `SystemType`, `SystemScope`, `SystemDescript`, `SystemTriggerNote`, `recordname`, `IsDeleted` FROM fusystems_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "systemID,systemName,SystemType,SystemScope,SystemDescript,SystemTriggerNote,recordname,IsDeleted">
    <cfset var validOrderColumns = "systemID,systemName,SystemType,SystemScope,SystemDescript,SystemTriggerNote,recordname,IsDeleted">
    <cfset var result = "">

    <!--- Build the WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getCFSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Add WHERE clauses to SQL if any --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Handle ORDER BY clause safely --->
    <cfif len(trim(arguments.orderBy)) and listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log the error details --->
            <cflog file="application" text="Error in getvm_fusystems_fuactions_actionusers: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with matching schema on error --->
            <cfset result = queryNew("systemID,systemName,SystemType,SystemScope,SystemDescript,SystemTriggerNote,recordname,IsDeleted", "integer,varchar,varchar,varchar,varchar,varchar,varchar,bit")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>

</cffunction>
<cffunction name="getvm_fusystems_fuactions_actionusers" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="systemID">

    <cfset var sql = "SELECT `systemID`, `systemName`, `SystemType`, `SystemScope`, `SystemDescript`, `SystemTriggerNote`, `recordname`, `IsDeleted` FROM fusystems_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var validColumns = "systemID,systemName,SystemType,SystemScope,SystemDescript,SystemTriggerNote,recordname,IsDeleted">
    <cfset var validOrderColumns = "systemID,systemName,SystemType,SystemScope,SystemDescript,SystemTriggerNote,recordname,IsDeleted">
    <cfset var result = "">

    <cftry>
        <!--- Build dynamic WHERE clause --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
                <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
            </cfif>
        </cfloop>

        <!--- Append WHERE clause if conditions exist --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        <cfelse>
            <!--- Return empty query if no filters are provided --->
            <cfreturn queryNew("systemID,systemName,SystemType,SystemScope,SystemDescript,SystemTriggerNote,recordname,IsDeleted", "integer,varchar,varchar,varchar,varchar,varchar,varchar,bit")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>

        <cfreturn result>

    <cfcatch type="any">
        <!--- Log error details --->
        <cflog file="application" text="Error in getvm_fusystems_fuactions_actionusers: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">

        <!--- Return an empty query on error --->
        <cfreturn queryNew("systemID,systemName,SystemType,SystemScope,SystemDescript,SystemTriggerNote,recordname,IsDeleted", "integer,varchar,varchar,varchar,varchar,varchar,varchar,bit")>
    </cfcatch>
    </cftry>

</cffunction>
<cffunction name="getvm_fusystems_fuactions_actionusers" access="public" returntype="query">
    <cfargument name="newpnids" type="string" required="true">
    <cfargument name="orderBy" type="string" required="false" default="systemID">
    <cfset var queryResult = "">
    <cfset var sql = "">
    <cfset var validOrderColumns = "systemID,actionID,actionNo,actionDaysNo,actionDaysRecurring,systemName,SystemType,SystemScope,SystemDescript,SystemTriggerNote,actionDetails,actionTitle,navToURL,actionNotes,actionInfo,uniquename,IsUnique">

    <cftry>
        <!--- Validate orderBy column --->
        <cfif not listFindNoCase(validOrderColumns, arguments.orderBy)>
            <cfset arguments.orderBy = "systemID">
        </cfif>

        <!--- Construct SQL query --->
        <cfset sql = "
            SELECT 
                systemID,
                actionID,
                actionNo,
                actionDaysNo,
                actionDaysRecurring,
                systemName,
                SystemType,
                SystemScope,
                SystemDescript,
                SystemTriggerNote,
                actionDetails,
                actionTitle,
                navToURL,
                actionNotes,
                actionInfo,
                uniquename,
                IsUnique
            FROM 
                vm_fusystems_fuactions_actionusers
            WHERE 
                systemID IN (#arguments.newpnids#)
            ORDER BY 
                #arguments.orderBy#
        ">

        <!--- Execute query --->
        <cfquery name="queryResult" datasource="yourDataSource">
            #sql#
        </cfquery>

        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getvm_fusystems_fuactions_actionusers: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">

            <!--- Return an empty query with the correct schema --->
            <cfset queryResult = queryNew("systemID,actionID,actionNo,actionDaysNo,actionDaysRecurring,systemName,SystemType,SystemScope,SystemDescript,SystemTriggerNote,actionDetails,actionTitle,navToURL,actionNotes,actionInfo,uniquename,IsUnique", "integer,integer,integer,integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction>
<cffunction name="getvm_fusystems_fusystemusers" access="public" returntype="query">
    <cfargument name="idlist" type="string" required="true">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="orderBy" type="string" required="false" default="suid">

    <cfset var validColumns = "suid,systemID,userid,contactid,systemName,SystemScope,suStatus">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT suid, systemID, userid, contactid, systemName, SystemScope, suStatus FROM vm_fusystems_fusystemusers WHERE isdeleted = 0 AND contactid IN (#arguments.idlist#) AND systemID = ?">
    <cfset var orderByClause = "">

    <!--- Validate and construct ORDER BY clause --->
    <cfif listFindNoCase(validColumns, arguments.orderBy)>
        <cfset orderByClause = " ORDER BY #arguments.orderBy#">
    </cfif>

    <cftry>
        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="yourDataSource">
            #sql#
            <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">
            #orderByClause#
        </cfquery>

        <!--- Return the query result --->
        <cfreturn queryResult>

        <cfcatch>
            <!--- Log the error details --->
            <cflog file="application" text="Error in getvm_fusystems_fusystemusers: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">

            <!--- Return an empty query with the correct structure --->
            <cfreturn queryNew("suid,systemID,userid,contactid,systemName,SystemScope,suStatus", "integer,integer,integer,integer,varchar,varchar,varchar")>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
