<cfcomponent displayname="NotificationService" hint="Handles operations for Notification table" output="false"> 
<cffunction name="INSnotifications" access="public" returntype="void">
    <cfargument name="new_contactname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO notifications (
                subtitle, 
                userid, 
                notifUrl, 
                notifTitle, 
                notifType, 
                contactid, 
                read
            ) VALUES (
                <cfqueryparam value="Maintenance system created for #arguments.new_contactname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="/app/contact/?contactid=#arguments.contactid#&t4=1" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Maintenance System Created!" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="System Added" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertNotification: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while inserting notification." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSnotifications_23830" access="public" returntype="void">
    <cfargument name="new_contactname" type="string" required="true">
    <cfargument name="contactid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            INSERT INTO notifications (
                subtitle, 
                userid, 
                notifUrl, 
                notifTitle, 
                notifType, 
                contactid, 
                read
            ) VALUES (
                <cfqueryparam value="Maintenance system created for #arguments.new_contactname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="/app/contact/?contactid=#arguments.contactid#&t4=1" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Maintenance System Created!" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="System Added" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error inserting notification: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INSnotifications_23937" access="public" returntype="void">
    <cfargument name="new_contactname" type="string" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="sunotes" type="string" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO notifications (
                subtitle,
                userid,
                notifUrl,
                notifTitle,
                notifType,
                contactid,
                read,
                notifdescript
            ) VALUES (
                <cfqueryparam value="Appointment completed. Follow-Up with #arguments.new_contactname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.new_userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="/app/contact/?contactid=#arguments.new_contactid#&t4=1" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Follow-Up System Created!" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="System Added" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">,
                <cfqueryparam value="#arguments.sunotes#" cfsqltype="CF_SQL_LONGVARCHAR">
            )
        </cfquery>
    <cfcatch>
        <cflog file="application" text="Error inserting notification: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the notification." detail="#cfcatch.detail#">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDnotifications" access="public" returntype="void">
    <cfargument name="notificationId" type="numeric" required="true">
    
    <cftry>
        <cfquery name="updateQuery" datasource="abod">
            UPDATE notifications 
            SET `read` = 1 
            WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.notificationId#">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating notification read status: #cfcatch.message#" type="error">
            <cflog file="application" text="Query: UPDATE notifications SET `read` = 1 WHERE id = #arguments.notificationId#" type="error">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDnotifications_24009" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            UPDATE notifications 
            SET trash = 1 
            WHERE userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#"> 
            AND trash = 0
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating notifications: #cfcatch.message#">
            <cfthrow message="An error occurred while updating notifications." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELnotifications" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                n.ID, 
                n.notiftitle, 
                n.notiftimestamp, 
                c.recordname, 
                n.subtitle, 
                n.notifurl 
            FROM 
                notifications n 
            INNER JOIN 
                contactdetails c ON c.contactid = n.contactid 
            WHERE 
                n.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_integer"> 
                AND n.read = 0 
                AND n.trash = 0
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUnreadNotifications: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELnotifications_24351" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                n.ID, 
                n.notiftitle, 
                n.notiftimestamp, 
                c.recordname, 
                n.subtitle, 
                n.notifurl, 
                n.contactid, 
                n.read, 
                n.trash
            FROM 
                notifications n
            LEFT JOIN 
                contactdetails c ON c.contactid = n.contactid
            WHERE 
                n.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_integer"> 
            AND 
                n.trash = 0
            ORDER BY 
                n.notiftimestamp DESC
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getNotifications: #cfcatch.message#">
            <cfset result = queryNew("ID, notiftitle, notiftimestamp, recordname, subtitle, notifurl, contactid, read, trash")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
