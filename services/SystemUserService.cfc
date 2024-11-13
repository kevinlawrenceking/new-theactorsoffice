<cfcomponent displayname="SystemUserService" hint="Handles operations for SystemUser table" output="false"> 

<cffunction name="INSfusystemusers" access="public" returntype="void">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_suStartDate" type="date" required="true">

    <cfquery result="result" >
        INSERT INTO fuSystemUsers (systemID, contactID, userID, suStartDate, suNotes)
        VALUES (
            <cfquery result="result" param value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#session.userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.new_suStartDate#" cfsqltype="CF_SQL_DATE">,
            <cfquery result="result" param value="Added via user batch update" cfsqltype="CF_SQL_VARCHAR">
        )
    </cfquery>
</cffunction>

<cffunction name="UPDfusystemusers" access="public" returntype="void">
    <cfargument name="suid" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE fusystemusers
        SET suStatus = <cfquery result="result" param value="Completed" cfsqltype="CF_SQL_VARCHAR">
        WHERE suid = <cfquery result="result" param value="#arguments.suid#" cfsqltype="CF_SQL_INTEGER">
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
        WHERE fc.contactid = <cfquery result="result" param value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER"> 
        AND s.systemtype = <cfquery result="result" param value="Maintenance List" cfsqltype="CF_SQL_VARCHAR"> 
        AND fc.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
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
        WHERE isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
        AND contactid IN (
            <cfloop array="#arguments.idlist#" index="id">
                <cfquery result="result" param value="#id#" cfsqltype="CF_SQL_INTEGER" list="true">
            </cfloop>
        )
        AND systemid = <cfquery result="result" param value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">
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
    <cfquery result="result"  name="updateQuery">
        #sql#
        <cfloop array="#paramList#" index="param">
            <cfquery result="result" param value="#param.value#" cfsqltype="#param.cfsqltype#">
        </cfloop>
    </cfquery>
</cffunction>

<cffunction name="INSfusystemusers_23934" access="public" returntype="void">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="suStartDate" type="date" required="true">
    <cfargument name="sunotes" type="string" required="true">

    <cfquery result="result" >
        INSERT INTO fuSystemUsers (systemID, contactID, userID, suStartDate, sunotes)
        VALUES (
            <cfquery result="result" param value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.new_userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfquery result="result" param value="#arguments.suStartDate#" cfsqltype="CF_SQL_DATE">,
            <cfquery result="result" param value="#arguments.sunotes#" cfsqltype="CF_SQL_VARCHAR">
        )
    </cfquery>
</cffunction>

<cffunction name="UPDfusystemusers_23935" access="public" returntype="void">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">

    <cfquery result="result" >
        UPDATE fusystemusers 
        SET sustatus = 'Completed' 
        WHERE userid = <cfquery result="result" param value="#arguments.new_userid#" cfsqltype="CF_SQL_INTEGER"> 
        AND systemid IN (5, 6) 
        AND contactid = <cfquery result="result" param value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="SELfusystemusers_24031" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    
        <cfquery name="result" datasource="abod">
            SELECT 
                n.notid, 
                a.id, 
                fu.systemid, 
                n.actionid, 
                n.suid, 
                fu.sustartdate, 
                a.actionDaysNo, 
                a.actiondaysrecurring, 
                n.notstartdate, 
                DATE_ADD(fu.sustartdate, INTERVAL a.actionDaysNo DAY) AS new_notstartdate
            FROM 
                fusystemusers fu
            INNER JOIN 
                funotifications n ON n.suid = fu.suid
            INNER JOIN 
                actionusers a ON a.actionid = n.actionid
            WHERE 
                fu.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> AND
                a.userid = fu.userid AND
                n.userID = fu.userid AND
                n.notstatus <> 'Completed' AND
                n.isdeleted = 0 AND
                n.notstartdate <> DATE_ADD(fu.sustartdate, INTERVAL a.actionDaysNo DAY)
            ORDER BY 
                n.notid
        </cfquery>
        
        <cfreturn result>
    
    
</cffunction>
<cffunction name="DETfusystemusers" access="public" returntype="query">
    <cfargument name="suid" type="numeric" required="true">
    
    <cfset var result = "">
    
    
        <cfquery name="result" datasource="abod">
            SELECT 
                fc.suID, 
                fc.contactid, 
                fc.userid, 
                fc.suStartDate, 
                fc.suenddate, 
                fc.suStatus, 
                s.systemName, 
                s.systemdescript, 
                s.systemtype, 
                s.systemscope, 
                s.systemid, 
                s.recordname
            FROM fusystemusers fc
            INNER JOIN fusystems s ON s.systemID = fc.systemID
            WHERE fc.suid = <cfquery result="result" param value="#arguments.suid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
</cffunction>
<cffunction name="UPDfusystemusers_24315" access="public" returntype="void">
    <cfargument name="suid" type="numeric" required="true">

    
        <cfquery result="result"  datasource="abod">
            UPDATE fusystemusers 
            SET isdeleted = 1 
            WHERE suid = <cfquery result="result" param value="#arguments.suid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        

</cffunction>
<cffunction name="SELfusystemusers_24343" access="public" returntype="query">
    <cfargument name="contactID" type="numeric" required="true">

    <cfset var result = "">

    
        <cfquery name="result" datasource="abod">
            SELECT fc.suID 
            FROM fusystemusers fc 
            WHERE fc.contactID = <cfquery result="result" param value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER"> 
            AND fc.suStatus = <cfquery result="result" param value="Active" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        


    <cfreturn result>
</cffunction>
<cffunction name="SELfusystemusers_24344" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_systemid" type="numeric" required="true">

    <cfset var result = "">
    
    
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM fusystemusers_tbl
            WHERE contactid = <cfquery result="result" param value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
              AND sustatus = <cfquery result="result" param value="Active" cfsqltype="CF_SQL_VARCHAR">
              AND isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
              AND systemid = <cfquery result="result" param value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        

    <cfreturn result>
</cffunction>
<cffunction name="UPDfusystemusers_24345" access="public" returntype="void">
    <cfargument name="new_contactid" type="numeric" required="true">
    
    
        <cfquery result="result"  name="updateQuery" datasource="abod">
            UPDATE fusystemusers_tbl 
            SET isdeleted = 1, sunotes = 'Deleted via batch update' 
            WHERE contactID = <cfquery result="result" param value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER"> 
            AND suStatus = <cfquery result="result" param value="Active" cfsqltype="CF_SQL_VARCHAR"> 
            AND isdeleted = <cfquery result="result" param value="0" cfsqltype="CF_SQL_BIT">
        </cfquery>
        
    
</cffunction>
<cffunction name="SELfusystemusers_24426" access="public" returntype="query">
    <cfargument name="maint_contactid" type="numeric" required="true">
    <cfargument name="maint_systemid" type="numeric" required="true">

    <cfset var result = "">

    
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM fusystemusers
            WHERE contactid = <cfquery result="result" param value="#arguments.maint_contactid#" cfsqltype="CF_SQL_INTEGER">
            AND systemid = <cfquery result="result" param value="#arguments.maint_systemid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

    

    <cfreturn result>
</cffunction>
<cffunction name="INSfusystemusers_24427" access="public" returntype="void">
    <cfargument name="maint_systemID" type="numeric" required="true">
    <cfargument name="maint_contactID" type="numeric" required="true">
    <cfargument name="userid" type="string" required="true">
    <cfargument name="suStartDate" type="date" required="true">

    
        <cfquery result="result"  datasource="abod">
            INSERT INTO fuSystemUsers (systemID, contactID, userID, suStartDate)
            VALUES (
                <cfquery result="result" param value="#arguments.maint_systemID#" cfsqltype="CF_SQL_INTEGER">,
                <cfquery result="result" param value="#arguments.maint_contactID#" cfsqltype="CF_SQL_INTEGER">,
                <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_VARCHAR">,
                <cfquery result="result" param value="#arguments.suStartDate#" cfsqltype="CF_SQL_DATE">
            )
        </cfquery>

    
</cffunction>
<cffunction name="INSfusystemusers_24477" access="public" returntype="void">
    <cfargument name="systemID" type="numeric" required="true">
    <cfargument name="contactID" type="numeric" required="true">
    <cfargument name="userID" type="string" required="true">
    <cfargument name="suStartDate" type="date" required="true">

    
        <cfquery result="result"  datasource="abod">
            INSERT INTO fuSystemUsers (systemID, contactID, userID, suStartDate)
            VALUES (
                <cfquery result="result" param value="#arguments.systemID#" cfsqltype="CF_SQL_INTEGER">,
                <cfquery result="result" param value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">,
                <cfquery result="result" param value="#arguments.userID#" cfsqltype="CF_SQL_VARCHAR">,
                <cfquery result="result" param value="#arguments.suStartDate#" cfsqltype="CF_SQL_DATE">
            )
        </cfquery>

    
</cffunction>
<cffunction name="SELfusystemusers_24718" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">
    <cfargument name="sessionUserId" type="numeric" required="true">

    <cfset var result = "">
    
    
        <cfquery name="result" datasource="abod">
            SELECT 
                fc.suID, 
                fc.contactid, 
                fc.userid, 
                fc.suStartDate, 
                fc.suenddate, 
                fc.suStatus, 
                s.systemName, 
                s.systemdescript, 
                s.systemtype, 
                s.systemscope, 
                s.systemid, 
                s.recordname
            FROM fusystemusers fc
            INNER JOIN fusystems s ON s.systemID = fc.systemID
            WHERE fc.contactID = <cfquery result="result" param value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER">
            AND fc.userID = <cfquery result="result" param value="#arguments.sessionUserId#" cfsqltype="CF_SQL_INTEGER">
            AND fc.sustatus = <cfquery result="result" param value="Active" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfreturn result>

</cffunction>
<cffunction name="SELfusystemusers_24758" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">
    <cfargument name="sessionUserId" type="numeric" required="true">
    <cfargument name="hideCompleted" type="string" required="false" default="N">

    <cfset var result = "">

    
        <cfquery name="result" datasource="abod">
            SELECT 
                fc.suID, 
                fc.contactid, 
                fc.userid, 
                fc.suStartDate, 
                fc.suenddate, 
                fc.suStatus, 
                s.systemName, 
                s.systemdescript, 
                s.systemtype, 
                s.systemscope, 
                s.systemid, 
                s.recordname
            FROM 
                fusystemusers fc
            INNER JOIN 
                fusystems s ON s.systemID = fc.systemID
            WHERE 
                fc.contactID = <cfquery result="result" param value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER"> 
                AND fc.userID = <cfquery result="result" param value="#arguments.sessionUserId#" cfsqltype="CF_SQL_INTEGER">
            <cfif arguments.hideCompleted is "Y">
                AND fc.suStatus <> 'Completed'
            </cfif>
            ORDER BY 
                fc.suStatus
        </cfquery>
        
        <cfreturn result>


    
</cffunction>
</cfcomponent>
