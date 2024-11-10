<cfcomponent displayname="SystemService" hint="Handles operations for System table" output="false"> 

<cffunction name="SELfusystemtypes" access="public" returntype="query" output="false">
    <cfquery name="queryResult">
        SELECT systemtype AS ID, systemtype AS systemname 
        FROM fusystemtypes 
        ORDER BY systemtype
    </cfquery>
    <cfreturn queryResult>
</cffunction>

<cffunction name="SELfusystems" access="public" returntype="query">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="session_userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cfquery name="result">
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
</cffunction>

<cffunction name="SELfusystems_23821" access="public" returntype="query">
    <cfargument name="newsystemscope" type="string" required="true">

    <cfset var result = "">
    
    <cfquery name="result">
        SELECT s.systemid
        FROM fusystems s
        WHERE s.systemtype = <cfqueryparam value="Maintenance List" cfsqltype="CF_SQL_VARCHAR">
        AND s.systemscope = <cfqueryparam value="#arguments.newsystemscope#" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>
    
    <cfreturn result>
</cffunction>

<cffunction name="SELfusystems_23933" access="public" returntype="query">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_systemid" type="numeric" required="false">

    <cfset var result = "">

    <cfquery name="result">
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
</cffunction>

<cffunction name="DETfusystems" access="public" returntype="query">
    <cfargument name="systemId" type="numeric" required="true">
    <cfset var result = "">

    <cfquery name="result">
        SELECT *
        FROM fusystems
        WHERE systemid = <cfqueryparam value="#arguments.systemId#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELfusystems_23938" access="public" returntype="query">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
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
</cffunction>

<cffunction name="SELfusystems_23944" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
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
</cffunction>

<cffunction name="DETfusystems_24029" access="public" returntype="query">
    <cfargument name="id" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT 
           