<cfcomponent displayname="EventTypesUserService" hint="Handles operations for EventTypesUser table" output="false" > 
<cffunction name="inserteventtypes_user" access="public" returntype="numeric">
    <cfargument name="eventTypeName" type="string" required="true">
    <cfargument name="eventTypeDescription" type="string" required="false" default="">
    <cfargument name="recordname" type="string" required="false" default="">
    <cfargument name="IsDeleted" type="boolean" required="true">
    <cfargument name="IsCustom" type="boolean" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="eventtypecolor" type="string" required="false" default="">
    
    <cfset var insertResult = 0>
    
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO eventtypes_user_tbl (
                eventTypeName, 
                eventTypeDescription, 
                recordname, 
                IsDeleted, 
                IsCustom, 
                userid, 
                eventtypecolor
            ) VALUES (
                <cfqueryparam value="#arguments.eventTypeName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.eventTypeDescription#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventTypeDescription)#">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">,
                <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.IsCustom#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.eventtypecolor#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventtypecolor)#">
            )
        </cfquery>
        
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error in inserteventtypes_user: #cfcatch.message# Details: #cfcatch.detail#">
            <cflog file="application" text="SQL: INSERT INTO eventtypes_user_tbl ...">
            <!--- Return 0 or handle as needed --->
        </cfcatch>
    </cftry>
    
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->

<cffunction name="geteventtypes_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="id">
    <cfset var sql = "SELECT `id`, `userid`, `eventTypeName`, `eventTypeDescription`, `recordname`, `eventtypecolor`, `IsDeleted`, `IsCustom` FROM eventtypes_user_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var params = []>
    <cfset var validColumns = "id,userid,eventTypeName,eventTypeDescription,recordname,eventtypecolor,IsDeleted,IsCustom">
    <cfset var validOrderColumns = "id,userid,eventTypeName">

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(params, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Add WHERE conditions to SQL --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    <cfelse>
        <!--- Return empty query if no filters are provided --->
        <cfreturn queryNew("id,userid,eventTypeName,eventTypeDescription,recordname,eventtypecolor,IsDeleted,IsCustom", "integer,integer,varchar,varchar,varchar,varchar,bit,bit")>
    </cfif>

    <!--- Validate and apply ORDER BY clause --->
    <cfif listFindNoCase(validOrderColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    <cfelse>
        <!--- Default to ordering by id if invalid column is provided --->
        <cfset sql &= " ORDER BY id">
    </cfif>

    <!--- Execute the query --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfreturn result>

        <!--- Error handling --->
        <cfcatch type="any">
            <cflog file="application" text="Error in geteventtypes_user: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query on error --->
            <cfreturn queryNew("id,userid,eventTypeName,eventTypeDescription,recordname,eventtypecolor,IsDeleted,IsCustom", "integer,integer,varchar,varchar,varchar,varchar,bit,bit")>
        </cfcatch>
    </cftry>
</cffunction> 

<!--- Changes made:
- No changes were necessary as the code is syntactically correct.
--->

<cffunction name="updateeventtypes_user" access="public" returntype="boolean">
    <cfargument name="id" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="eventTypeName" type="string" required="true">
    <cfargument name="eventTypeDescription" type="string" required="false" default="">
    <cfargument name="recordname" type="string" required="false" default="">
    <cfargument name="eventtypecolor" type="string" required="false" default="">
    <cfargument name="IsDeleted" type="boolean" required="true">
    <cfargument name="IsCustom" type="boolean" required="true">

    <cfset var result = false>
    <cfset var sql = "UPDATE eventtypes_user_tbl SET eventTypeName = ?, eventTypeDescription = ?, recordname = ?, eventtypecolor = ?, IsDeleted = ?, IsCustom = ? WHERE id = ? AND userid = ?">
    
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfqueryparam value="#arguments.eventTypeName#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.eventTypeDescription#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventTypeDescription)#">
            <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
            <cfqueryparam value="#arguments.eventtypecolor#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.eventtypecolor)#">
            <cfqueryparam value="#arguments.IsDeleted#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.IsCustom#" cfsqltype="CF_SQL_BIT">
            <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset result = true>
        <cfcatch>
            <cflog file="application" text="Error in updateeventtypes_user: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction> 
<!--- Changes made:
- None. The code is syntactically correct.
--->
</cfcomponent>
