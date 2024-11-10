<cfcomponent displayname="SystemUserService" hint="Handles operations for SystemUser table" output="false"> 

<cffunction name="INSfusystemusers" access="public" returntype="void">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_suStartDate" type="date" required="true">

    <cfquery>
        INSERT INTO fuSystemUsers (systemID, contactID, userID, suStartDate, suNotes)
        VALUES (
            <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.new_suStartDate#" cfsqltype="CF_SQL_DATE">,
            <cfqueryparam value="Added via user batch update" cfsqltype="CF_SQL_VARCHAR">
        )
    </cfquery>
</cffunction>

<cffunction name="UPDfusystemusers" access="public" returntype="void">
    <cfargument name="suid" type="numeric" required="true">

    <cfquery>
        UPDATE fusystemusers
        SET suStatus = <cfqueryparam value="Completed" cfsqltype="CF_SQL_VARCHAR">
        WHERE suid = <cfqueryparam value="#arguments.suid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="SELfusystemusers" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT fc.suID 
        FROM fusystemusers fc 
        INNER JOIN fusystems s ON s.systemID = fc.systemID 
        WHERE fc.contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER"> 
        AND s.systemtype = <cfqueryparam value="Maintenance List" cfsqltype="CF_SQL_VARCHAR"> 
        AND fc.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELfusystemusers_23864" access="public" returntype="query">
    <cfargument name="idlist" type="array" required="true">
    <cfargument name="new_systemid" type="numeric" required="true">

    <cfset var result = "">

    <cfquery name="result">
        SELECT COUNT(*) AS totals
        FROM fusystemusers_tbl
        WHERE isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
        AND contactid IN (
            <cfloop array="#arguments.idlist#" index="id">
                <cfqueryparam value="#id#" cfsqltype="CF_SQL_INTEGER" list="true">
            </cfloop>
        )
        AND systemid = <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="UPDfusystemusers_23865" access="public" returntype="void">
    <cfargument name="idList" type="array" required="true">
    <cfargument name="newSystemId" type="numeric" required="true">

    <cfset var sql = "">
    <cfset var paramList = []>

    <!--- Build the SQL query dynamically --->
    <cfset sql = "UPDATE fusystemusers_tbl SET isdeleted = 1 WHERE contactid IN (" & ListToPlaceholders(arguments.idList) & ") AND systemid = ?" >

    <!--- Add parameters for cfqueryparam --->
    <cfloop array="#arguments.idList#" index="id">
        <cfset arrayAppend(paramList, {value=id, cfsqltype="CF_SQL_INTEGER"})>
    </cfloop>
    <cfset arrayAppend(paramList, {value=arguments.newSystemId, cfsqltype="CF_SQL_INTEGER"})>

    <!--- Execute the query --->
    <cfquery name="updateQuery">
        #sql#
        <cfloop array="#paramList#" index="param">
            <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
    </cfquery>
</cffunction>

<cffunction name="INSfusystemusers_23934" access="public" returntype="void">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="suStartDate" type="date" required="true">
    <cfargument name="sunotes" type="string" required="true">

    <cfquery>
        INSERT INTO fuSystemUsers (systemID, contactID, userID, suStartDate, sunotes)
        VALUES (
            <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.new_userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="#arguments.suStartDate#" cfsqltype="CF_SQL_DATE">,
            <cfqueryparam value="#arguments.sunotes#" cfsqltype="CF_SQL_VARCHAR">
        )
    </cfquery>
</cffunction>

<cffunction name="UPDfusystemusers_23935" access="public" returntype="void">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">

    <cfquery>
        UPDATE fusystemusers 
        SET sustatus = 'Completed' 
        WHERE userid = <cfqueryparam value="#arguments.new_userid#" cfsqltype="CF_SQL_INTEGER"> 
        AND systemid IN (5, 6) 
        AND contactid = <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="SELfusystemusers_24031" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT 
            n.notid, 
            a.id, 
            fu.systemid, 
            n.actionid, 
            n.suid, 
            fu.sustartdate, 
