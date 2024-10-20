<cfcomponent displayname="AuditionDialectsUserService" hint="Handles operations for AuditionDialectsUser table" output="false" > 
<cffunction name="insertauddialects_user" access="public" returntype="numeric">
    <cfargument name="auddialectid" type="numeric" required="true">
    <cfargument name="auddialect" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="audCatid" type="numeric" required="false" default="2">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>
    <cfargument name="recordname" type="string" required="false" default="">
    
    <cfset var insertResult = 0>
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="queryResult">
            INSERT INTO auddialects_user_tbl (
                auddialectid, 
                auddialect, 
                userid, 
                audCatid, 
                isDeleted, 
                recordname
            ) VALUES (
                <cfqueryparam value="#arguments.auddialectid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.auddialect#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.audCatid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.recordname)#">
            )
        </cfquery>
        <cfset insertResult = queryResult.generatedKey>
        
        <cfcatch>
            <cflog file="application" text="Error in insertauddialects_user: #cfcatch.message# - #cfcatch.detail#">
            <cflog file="application" text="SQL: INSERT INTO auddialects_user_tbl (auddialectid, auddialect, userid, audCatid, isDeleted, recordname) VALUES (#arguments.auddialectid#, '#arguments.auddialect#', #arguments.userid#, #arguments.audCatid#, #arguments.isDeleted#, '#arguments.recordname#')">
            <!--- Return 0 or handle as necessary for your application --->
            <cfset insertResult = 0>
        </cfcatch>
    </cftry>
    
    <cfreturn insertResult>
</cffunction> 

<!--- Changes made:
- None. The function code is syntactically correct.
--->

<cffunction name="getauddialects_user" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="auddialectid">
    
    <cfset var sql = "SELECT auddialectid, auddialect, userid, audCatid, isDeleted, recordname FROM auddialects_user_tbl WHERE 1=1">
    <cfset var queryParams = []>
    <cfset var validColumns = "auddialectid,auddialect,userid,audCatid,isDeleted,recordname">
    <cfset var validOrderByColumns = "auddialectid,auddialect,userid,audCatid,isDeleted,recordname">
    
    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset sql &= " AND `#key#` = ?">
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=de(listGetAt(validColumns, listFindNoCase(validColumns, key), ","))})>
        </cfif>
    </cfloop>
    
    <!--- Add ORDER BY clause if valid --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY `#arguments.orderBy#`">
    </cfif>

    <!--- Execute query within try/catch block --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getauddialects_user: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
            <!--- Return an empty query with the correct structure on error --->
            <cfset result = queryNew("auddialectid,auddialect,userid,audCatid,isDeleted,recordname", "integer,varchar,integer,integer,bit,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct.
--->
</cfcomponent>
