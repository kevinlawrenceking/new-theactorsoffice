<cfcomponent displayname="SystemUserService" hint="Handles operations for SystemUser table" output="false"> 
<cffunction name="insertSystemUser" access="public" returntype="void">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_suStartDate" type="date" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO fuSystemUsers (systemID, contactID, userID, suStartDate, suNotes)
            VALUES (
                <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_suStartDate#" cfsqltype="CF_SQL_DATE">,
                <cfqueryparam value="Added via user batch update" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertSystemUser: #cfcatch.message#">
            <cfthrow message="Error inserting system user." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateUserStatus" access="public" returntype="void">
    <cfargument name="suid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE fusystemusers
            SET suStatus = <cfqueryparam value="Completed" cfsqltype="CF_SQL_VARCHAR">
            WHERE suid = <cfqueryparam value="#arguments.suid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating user status: #cfcatch.message# Query: #cfcatch.Detail#">
            <cfthrow message="Error updating user status." detail="#cfcatch.Detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserSystemID" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT fc.suID 
            FROM fusystemusers fc 
            INNER JOIN fusystems s ON s.systemID = fc.systemID 
            WHERE fc.contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER"> 
            AND s.systemtype = <cfqueryparam value="Maintenance List" cfsqltype="CF_SQL_VARCHAR"> 
            AND fc.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getUserSystemID: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="Database error occurred. Please try again later.">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getUserCount" access="public" returntype="query">
    <cfargument name="idlist" type="array" required="true">
    <cfargument name="new_systemid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
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
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserCount: #cfcatch.message#">
            <cfthrow message="Error executing query in getUserCount." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="updateUserDeletionStatus" access="public" returntype="void">
    <cfargument name="idList" type="array" required="true">
    <cfargument name="newSystemId" type="numeric" required="true">

    <cfset var sql = "">
    <cfset var paramList = []>

    <cftry>
        <!--- Build the SQL query dynamically --->
        <cfset sql = "UPDATE fusystemusers_tbl SET isdeleted = 1 WHERE contactid IN (" & ListToPlaceholders(arguments.idList) & ") AND systemid = ?" >

        <!--- Add parameters for cfqueryparam --->
        <cfloop array="#arguments.idList#" index="id">
            <cfset arrayAppend(paramList, {value=id, cfsqltype="CF_SQL_INTEGER"})>
        </cfloop>
        <cfset arrayAppend(paramList, {value=arguments.newSystemId, cfsqltype="CF_SQL_INTEGER"})>

        <!--- Execute the query --->
        <cfquery name="updateQuery" datasource="yourDataSource">
            #sql#
            <cfloop array="#paramList#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error updating user deletion status: #cfcatch.message# SQL: #sql# Parameters: #paramList#">
        <!--- Optionally rethrow or handle the error --->
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertFuSystemUser" access="public" returntype="void">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="suStartDate" type="date" required="true">
    <cfargument name="sunotes" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO fuSystemUsers (systemID, contactID, userID, suStartDate, sunotes)
            VALUES (
                <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.suStartDate#" cfsqltype="CF_SQL_DATE">,
                <cfqueryparam value="#arguments.sunotes#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in insertFuSystemUser: #cfcatch.message# - Query: INSERT INTO fuSystemUsers (systemID, contactID, userID, suStartDate, sunotes) VALUES (#arguments.new_systemid#, #arguments.new_contactid#, #arguments.new_userid#, '#arguments.suStartDate#', '#arguments.sunotes#')">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateUserStatus" access="public" returntype="void">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE fusystemusers 
            SET sustatus = 'Completed' 
            WHERE userid = <cfqueryparam value="#arguments.new_userid#" cfsqltype="CF_SQL_INTEGER"> 
            AND systemid IN (5, 6) 
            AND contactid = <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating user status: #cfcatch.message# - Query: UPDATE fusystemusers SET sustatus = 'Completed' WHERE userid = #arguments.new_userid# AND systemid IN (5, 6) AND contactid = #arguments.new_contactid#;">
            <cfthrow message="An error occurred while updating the user status." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getNotifications" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
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
                fu.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> AND
                a.userid = fu.userid AND
                n.userID = fu.userid AND
                n.notstatus <> 'Completed' AND
                n.isdeleted = 0 AND
                n.notstartdate <> DATE_ADD(fu.sustartdate, INTERVAL a.actionDaysNo DAY)
            ORDER BY 
                n.notid
        </cfquery>
        
        <cfreturn result>
        
    <cfcatch type="any">
        <cflog file="application" text="Error in getNotifications: #cfcatch.message#">
        <cfreturn queryNew("")>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getSystemUserDetails" access="public" returntype="query">
    <cfargument name="suid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
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
            WHERE fc.suid = <cfqueryparam value="#arguments.suid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getSystemUserDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateUserIsDeleted" access="public" returntype="void">
    <cfargument name="suid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="yourDataSource">
            UPDATE fusystemusers 
            SET isdeleted = 1 
            WHERE suid = <cfqueryparam value="#arguments.suid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating isdeleted for suid #arguments.suid#: #cfcatch.message#" type="error">
            <cfthrow message="Database update failed" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getActiveSystemUserIDs" access="public" returntype="query">
    <cfargument name="contactID" type="numeric" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT fc.suID 
            FROM fusystemusers fc 
            WHERE fc.contactID = <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER"> 
            AND fc.suStatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveSystemUserIDs: #cfcatch.message# Query: SELECT fc.suID FROM fusystemusers WHERE contactID = #arguments.contactID# AND suStatus = 'Active'" />
            <cfset result = queryNew("suID", "integer")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getActiveSystemUsers" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_systemid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM fusystemusers_tbl
            WHERE contactid = <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
              AND sustatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
              AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
              AND systemid = <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveSystemUsers: #cfcatch.message# Query: SELECT * FROM fusystemusers_tbl WHERE contactid = ? AND sustatus = 'Active' AND isdeleted = 0 AND systemid = ? Parameters: new_contactid=#arguments.new_contactid#, new_systemid=#arguments.new_systemid#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="updateUserStatus" access="public" returntype="void">
    <cfargument name="new_contactid" type="numeric" required="true">
    
    <cftry>
        <cfquery name="updateQuery" datasource="abod">
            UPDATE fusystemusers_tbl 
            SET isdeleted = 1, sunotes = 'Deleted via batch update' 
            WHERE contactID = <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER"> 
            AND suStatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR"> 
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating user status: #cfcatch.message#">
            <cfthrow message="Error executing the update query." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserByContactAndSystem" access="public" returntype="query">
    <cfargument name="maint_contactid" type="numeric" required="true">
    <cfargument name="maint_systemid" type="numeric" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM fusystemusers
            WHERE contactid = <cfqueryparam value="#arguments.maint_contactid#" cfsqltype="CF_SQL_INTEGER">
            AND systemid = <cfqueryparam value="#arguments.maint_systemid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch>
            <cflog file="application" type="error" text="Error in getUserByContactAndSystem: #cfcatch.message#">
            <cfthrow message="Database error occurred. Please check the logs for more details.">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="insertSystemUser" access="public" returntype="void">
    <cfargument name="maint_systemID" type="numeric" required="true">
    <cfargument name="maint_contactID" type="numeric" required="true">
    <cfargument name="userid" type="string" required="true">
    <cfargument name="suStartDate" type="date" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO fuSystemUsers (systemID, contactID, userID, suStartDate)
            VALUES (
                <cfqueryparam value="#arguments.maint_systemID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.maint_contactID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.suStartDate#" cfsqltype="CF_SQL_DATE">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into fuSystemUsers: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="insertSystemUser" access="public" returntype="void">
    <cfargument name="systemID" type="numeric" required="true">
    <cfargument name="contactID" type="numeric" required="true">
    <cfargument name="userID" type="string" required="true">
    <cfargument name="suStartDate" type="date" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO fuSystemUsers (systemID, contactID, userID, suStartDate)
            VALUES (
                <cfqueryparam value="#arguments.systemID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.suStartDate#" cfsqltype="CF_SQL_DATE">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting into fuSystemUsers: #cfcatch.message#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getActiveSystemUsers" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">
    <cfargument name="sessionUserId" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
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
            WHERE fc.contactID = <cfqueryparam value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER">
            AND fc.userID = <cfqueryparam value="#arguments.sessionUserId#" cfsqltype="CF_SQL_INTEGER">
            AND fc.sustatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveSystemUsers: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserSystemDetails" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">
    <cfargument name="sessionUserId" type="numeric" required="true">
    <cfargument name="hideCompleted" type="string" required="false" default="N">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="yourDataSource">
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
                fc.contactID = <cfqueryparam value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER"> 
                AND fc.userID = <cfqueryparam value="#arguments.sessionUserId#" cfsqltype="CF_SQL_INTEGER">
            <cfif arguments.hideCompleted is "Y">
                AND fc.suStatus <> 'Completed'
            </cfif>
            ORDER BY 
                fc.suStatus
        </cfquery>
        
        <cfreturn result>

    <cfcatch type="any">
        <cflog file="application" text="Error in getUserSystemDetails: #cfcatch.message#; Query: #result.sql#; Parameters: currentid=#arguments.currentid#, sessionUserId=#arguments.sessionUserId#, hideCompleted=#arguments.hideCompleted#">
        <cfthrow message="An error occurred while retrieving user system details." detail="#cfcatch.detail#">
    </cfcatch>
    </cftry>
</cffunction></cfcomponent>
