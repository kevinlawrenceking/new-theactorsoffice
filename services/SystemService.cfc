<cfcomponent displayname="SystemService" hint="Handles operations for System table" output="false"> 
<cffunction name="getSystemActions" access="public" returntype="query">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="session_userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                s.systemID, 
                s.systemName, 
                s.SystemType, 
                s.SystemScope, 
                s.SystemDescript, 
                s.SystemTriggerNote, 
                a.actionID, 
                a.actionNo, 
                a.actionDetails, 
                a.actionTitle, 
                a.navToURL, 
                au.actionDaysNo, 
                au.actionDaysRecurring, 
                a.actionNotes, 
                a.actionInfo, 
                a.IsUnique, 
                a.uniquename
            FROM fusystems s
            INNER JOIN fuactions a ON s.systemid = a.systemid
            INNER JOIN actionusers au ON au.actionid = a.actionid
            WHERE s.systemID = <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">
            AND au.userid = <cfqueryparam value="#arguments.session_userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY a.actionNo
        </cfquery>
        
        <cfreturn result>

        <cfcatch type="any">
            <cflog file="application" text="Error in getSystemActions: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while retrieving system actions." detail="#cfcatch.message#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSystemIdsByScope" access="public" returntype="query">
    <cfargument name="newsystemscope" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT s.systemid
            FROM fusystems s
            WHERE s.systemtype = <cfqueryparam value="Maintenance List" cfsqltype="CF_SQL_VARCHAR">
            AND s.systemscope = <cfqueryparam value="#arguments.newsystemscope#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSystemIdsByScope: #cfcatch.message# Query: SELECT s.systemid FROM fusystems WHERE systemtype = 'Maintenance List' AND systemscope = #arguments.newsystemscope#">
            <cfset result = queryNew("systemid", "integer")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getActiveSystemUserIDs" access="public" returntype="query">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_systemid" type="numeric" required="false">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT su.suid 
            FROM fusystems s 
            INNER JOIN fusystemusers su ON su.systemID = s.systemid 
            WHERE su.suStatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR"> 
            AND su.userid = <cfqueryparam value="#arguments.new_userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND su.contactid = <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER"> 
            AND (s.systemid = <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER" null="#not structKeyExists(arguments, 'new_systemid')#"> 
                 OR s.systemid IN (<cfqueryparam value="3,4" cfsqltype="CF_SQL_INTEGER" list="true">))
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveSystemUserIDs: #cfcatch.message# Query: #result.sql#">
            <cfreturn queryNew("suid", "integer")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSystemById" access="public" returntype="query">
    <cfargument name="systemId" type="numeric" required="true">
    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM fusystems
            WHERE systemid = <cfqueryparam value="#arguments.systemId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getSystemById: #cfcatch.message#; SQL: SELECT * FROM fusystems WHERE systemid = #arguments.systemId#">
            <cfthrow message="Database query error" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>
<cffunction name="getSystemActions" access="public" returntype="query">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                s.systemID, s.systemName, s.SystemType, s.SystemScope, s.SystemDescript, 
                s.SystemTriggerNote, a.actionID, a.actionNo, a.actionDetails, a.actionTitle, 
                a.navToURL, au.actionDaysNo, au.actionDaysRecurring, a.actionNotes, 
                a.actionInfo, a.IsUnique, a.uniquename
            FROM 
                fusystems s 
            INNER JOIN 
                fuactions a ON s.systemid = a.systemid 
            INNER JOIN 
                actionusers au ON au.actionid = a.actionid 
            WHERE 
                a.systemID = <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER"> 
                AND au.userid = <cfqueryparam value="#arguments.new_userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND au.actionDaysNo IS NOT NULL 
                AND a.actionID IS NOT NULL 
            ORDER BY 
                a.actionNo
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getSystemActions: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getActionDetailsForUser" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                au.id, 
                s.systemID, 
                s.systemName, 
                s.SystemType, 
                s.SystemScope, 
                s.SystemDescript, 
                s.SystemTriggerNote, 
                a.actionID, 
                a.actionNo, 
                a.actionDetails, 
                a.actionTitle, 
                a.navToURL, 
                au.actionDaysNo, 
                au.actionDaysRecurring, 
                a.actionNotes, 
                a.actionInfo
            FROM fusystems s
            INNER JOIN fuactions a ON s.systemid = a.systemid
            INNER JOIN actionusers au ON au.actionid = a.actionid
            WHERE au.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY a.actionNo
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActionDetailsForUser: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getActionUserDetails" access="public" returntype="query">
    <cfargument name="id" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                au.id, 
                s.systemID, 
                s.systemName, 
                s.SystemType, 
                s.SystemScope, 
                s.SystemDescript, 
                s.SystemTriggerNote, 
                a.actionID, 
                a.actionNo, 
                a.actionDetails, 
                a.actionTitle, 
                a.navToURL, 
                au.actionDaysNo, 
                au.actionDaysRecurring, 
                a.actionNotes, 
                a.actionInfo
            FROM fusystems s
            INNER JOIN fuactions a ON s.systemid = a.systemid
            INNER JOIN actionusers au ON au.actionid = a.actionid
            WHERE au.id = <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getActionUserDetails: #cfcatch.message# - Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while retrieving action user details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getFilteredSystems" access="public" returntype="query">
    <cfargument name="systemtype" type="string" required="true">
    <cfargument name="systemscope" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT * 
            FROM fusystems 
            WHERE systemtype = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.systemtype#" />
            AND systemscope = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.systemscope#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getFilteredSystems: #cfcatch.message# - Query: SELECT * FROM fusystems WHERE systemtype = ? AND systemscope = ? - Parameters: #arguments.systemtype#, #arguments.systemscope#">
            <cfthrow message="An error occurred while retrieving systems. Please try again later.">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getSystemDetails" access="public" returntype="query">
    <cfargument name="systemType" type="string" required="true">
    <cfargument name="systemScope" type="string" required="true">

    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM fusystems
            WHERE systemtype = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.systemType#" />
            AND systemscope = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.systemScope#" />
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getSystemDetails: #cfcatch.message# Query: SELECT * FROM fusystems WHERE systemtype = ? AND systemscope = ? Parameters: systemType=#arguments.systemType#, systemScope=#arguments.systemScope#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>
<cffunction name="getOrderedFusystems" access="public" returntype="query">
    <cfargument name="systemIds" type="array" required="true">
    
    <cfset var result = "">
    <cfset var sql = "SELECT * FROM fusystems WHERE systemid IN (#createPlaceholders(arguments.systemIds)#) ORDER BY FIELD(systemid, #createPlaceholders(arguments.systemIds)#)">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#arguments.systemIds#" index="systemId">
                <cfqueryparam value="#systemId#" cfsqltype="CF_SQL_INTEGER">
            </cfloop>
            <cfloop array="#arguments.systemIds#" index="systemId">
                <cfqueryparam value="#systemId#" cfsqltype="CF_SQL_INTEGER">
            </cfloop>
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getOrderedFusystems: #cfcatch.message# Query: #sql# Parameters: #arguments.systemIds#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getActionDetails" access="public" returntype="query">
    <cfargument name="systemID" type="numeric" required="true">
    <cfargument name="userID" type="numeric" required="true">
    
    <cfset var queryResult = "">
    
    <cftry>
        <cfquery name="queryResult" datasource="yourDataSource">
            SELECT 
                au.id, 
                s.systemID, 
                s.systemName, 
                s.SystemType, 
                s.SystemScope, 
                s.SystemDescript, 
                s.SystemTriggerNote, 
                a.actionID, 
                a.actionNo, 
                a.actionDetails, 
                a.actionTitle, 
                a.navToURL, 
                au.actionDaysNo, 
                au.actionDaysRecurring, 
                a.actionNotes, 
                a.actionInfo
            FROM fusystems s
            INNER JOIN fuactions a ON s.systemid = a.systemid
            INNER JOIN actionusers au ON au.actionid = a.actionid
            WHERE a.systemID = <cfqueryparam value="#arguments.systemID#" cfsqltype="CF_SQL_INTEGER">
            AND au.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY a.actionNo
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActionDetails: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn queryResult>
</cffunction>
<cffunction name="getActionDetails" access="public" returntype="query">
    <cfargument name="systemID" type="numeric" required="true">
    <cfargument name="userID" type="numeric" required="true">

    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT MAX(au.id) AS id, a.actionID, a.actionTitle, a.actionno 
            FROM fusystems s 
            INNER JOIN fuactions a ON s.systemid = a.systemid 
            INNER JOIN actionusers_tbl au ON au.actionid = a.actionid 
            WHERE a.systemID = <cfqueryparam value="#arguments.systemID#" cfsqltype="CF_SQL_INTEGER"> 
            AND au.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER"> 
            AND au.isdeleted = 1 
            AND a.actionid NOT IN (
                SELECT a.actionID 
                FROM fusystems s 
                INNER JOIN fuactions a ON s.systemid = a.systemid 
                INNER JOIN actionusers au ON au.actionid = a.actionid 
                WHERE a.systemID = <cfqueryparam value="#arguments.systemID#" cfsqltype="CF_SQL_INTEGER"> 
                AND au.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            ) 
            GROUP BY a.actionID, a.actionTitle, a.actionno 
            ORDER BY a.actionno
        </cfquery>
        <cfreturn result>
    <cfcatch type="any">
        <cflog file="application" text="Error in getActionDetails: #cfcatch.message# Query: #cfcatch.detail#">
        <cfreturn queryNew("id,actionID,actionTitle,actionno", "integer,varchar,varchar,varchar")>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSystemIds" access="public" returntype="query">
    <cfargument name="systemType" type="string" required="true">
    <cfargument name="systemScope" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT systemid 
            FROM fusystems 
            WHERE systemtype = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.systemType#" />
            AND SystemScope = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.systemScope#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSystemIds: #cfcatch.message# Query: SELECT systemid FROM fusystems WHERE systemtype = ? AND SystemScope = ? Parameters: #arguments.systemType#, #arguments.systemScope#">
            <cfreturn queryNew("systemid")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getSystemActions" access="public" returntype="query">
    <cfargument name="maint_systemID" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                s.systemID, 
                s.systemName, 
                s.SystemType, 
                s.SystemScope, 
                s.SystemDescript, 
                s.SystemTriggerNote, 
                a.actionID, 
                a.actionNo, 
                a.actionDetails, 
                a.actionTitle, 
                a.navToURL, 
                au.actionDaysNo, 
                au.actionDaysRecurring, 
                a.actionNotes, 
                a.actionInfo, 
                a.IsUnique
            FROM fusystems s
            INNER JOIN fuactions a ON s.systemid = a.systemid
            INNER JOIN actionusers au ON au.actionid = a.actionid
            WHERE a.systemID = <cfqueryparam value="#arguments.maint_systemID#" cfsqltype="CF_SQL_INTEGER">
            AND au.actionDaysNo IS NOT NULL
            AND au.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY a.actionNo
        </cfquery>
        
        <cfcatch>
            <cflog file="application" text="Error in getSystemActions: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getSystemData" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    <cfset var queryResult = "">
    <cfset var sql = "SELECT systemid AS id, systemname FROM fusystems">
    <cfset var whereClause = "">
    <cfset var paramList = "">
    
    <!--- Build WHERE clause dynamically based on conditions argument --->
    <cfif structCount(arguments.conditions) gt 0>
        <cfset whereClause = " WHERE ">
        <cfloop collection="#arguments.conditions#" item="key">
            <cfset whereClause &= "#key# = ? AND ">
            <cfset paramList &= "<cfqueryparam value='#arguments.conditions[key]#' cfsqltype='#getSQLType(key)#'>,">
        </cfloop>
        <!--- Remove trailing 'AND ' and comma --->
        <cfset whereClause = left(whereClause, len(whereClause) - 4)>
        <cfset paramList = left(paramList, len(paramList) - 1)>
    </cfif>

    <!--- Complete SQL statement with ORDER BY clause --->
    <cfset sql &= whereClause & " ORDER BY systemname">

    <!--- Execute query within try/catch for error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            #paramList#
        </cfquery>
        <cfcatch type="any">
            <cflog file="errorLog" text="Error executing query: #cfcatch.message# SQL: #sql# Parameters: #serializeJSON(arguments.conditions)#"/>
            <!--- Return empty query if error occurs --->
            <cfreturn queryNew("id,systemname", "integer,varchar")>
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn queryResult>
</cffunction>
<cffunction name="getSystemActions" access="public" returntype="query">
    <cfargument name="systemid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                s.systemID, 
                s.systemName, 
                s.SystemType, 
                s.SystemScope, 
                s.SystemDescript, 
                s.SystemTriggerNote, 
                a.actionID, 
                a.actionNo, 
                a.actionDetails, 
                a.actionTitle, 
                a.navToURL, 
                au.actionDaysNo, 
                au.actionDaysRecurring, 
                a.actionNotes, 
                a.actionInfo, 
                a.IsUnique, 
                a.uniquename
            FROM fusystems s
            INNER JOIN fuactions a ON s.systemid = a.systemid
            INNER JOIN actionusers au ON au.actionid = a.actionid
            WHERE s.systemID = <cfqueryparam value="#arguments.systemid#" cfsqltype="CF_SQL_INTEGER">
            AND au.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY a.actionNo
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSystemActions: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getFilteredSystems" access="public" returntype="query">
    <cfargument name="new_systemscope" type="string" required="true">
    <cfargument name="currentid" type="numeric" required="true">
    <cfargument name="session_userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM fusystems 
            WHERE systemscope = <cfqueryparam value="#arguments.new_systemscope#" cfsqltype="CF_SQL_VARCHAR"> 
              AND systemid NOT IN (
                  SELECT systemid 
                  FROM fusystemusers 
                  WHERE contactID = <cfqueryparam value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER"> 
                    AND userID = <cfqueryparam value="#arguments.session_userid#" cfsqltype="CF_SQL_INTEGER"> 
                    AND suStatus = <cfqueryparam value='Active' cfsqltype='CF_SQL_VARCHAR'>
              ) 
            ORDER BY FIELD(systemtype, 'Targeted List', 'Follow Up', 'Maintenance List')
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getFilteredSystems: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSystemDetails" access="public" returntype="query">
    <cfargument name="systemID" type="numeric" required="false">
    <cfargument name="systemName" type="string" required="false">
    
    <cfset var queryResult = "">
    <cfset var sql = "SELECT s.systemID, s.systemName, s.SystemType, s.SystemScope, s.SystemDescript, s.SystemTriggerNote FROM fusystems s">
    <cfset var whereClauses = []>
    <cfset var params = []>

    <!--- Build dynamic WHERE clause --->
    <cfif structKeyExists(arguments, "systemID")>
        <cfset arrayAppend(whereClauses, "s.systemID = ?")>
        <cfset arrayAppend(params, {value=arguments.systemID, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>

    <cfif structKeyExists(arguments, "systemName")>
        <cfset arrayAppend(whereClauses, "s.systemName = ?")>
        <cfset arrayAppend(params, {value=arguments.systemName, cfsqltype="CF_SQL_VARCHAR"})>
    </cfif>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(whereClauses) gt 0>
        <cfset sql = sql & " WHERE " & arrayToList(whereClauses, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfset sql = sql & " ORDER BY s.systemName">

    <!--- Execute the query --->
    <cftry>
        <cfquery name="queryResult" datasource="yourDataSource">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

        <cfcatch type="any">
            <cflog file="errorLog" text="Error executing getSystemDetails: #cfcatch.message# SQL: #sql# Parameters: #serializeJSON(params)#">
            <cfreturn queryNew("")> <!--- Return empty query on error --->
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction></cfcomponent>
