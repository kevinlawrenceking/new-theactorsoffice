<cfcomponent displayname="NotificationService" hint="Handles operations for Notification table" > 

<cffunction name="deleteOrphanedNotifications" access="public" returntype="void" hint="Marks orphaned notifications as deleted.">
    <cfquery name="del" >
       UPDATE funotifications_tbl 
        SET isdeleted = 1 
        WHERE isdeleted = 0  
        AND suid NOT IN (SELECT suid FROM fusystemusers)
    </cfquery>
</cffunction>


    <cffunction output="false" name="SELfunotifications_24711" access="public" returntype="query">
        <cfargument name="currentid" type="numeric" required="true">
        
        <cfquery result="result" name="notsall">
            SELECT
                n.notID
            FROM funotifications n
            INNER JOIN fusystemusers f ON f.suID = n.suID
            INNER JOIN fusystems s ON s.systemID = f.systemID
            INNER JOIN fuactions a ON a.actionID = n.actionID
            WHERE f.contactID = <cfqueryparam value="#arguments.currentid#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfreturn notsall>
    </cffunction>

    <cffunction output="false" name="SELfunotifications_24706" access="public" returntype="query">
        <cfargument name="currentid" type="numeric" required="true">
        <cfargument name="sysActiveSuid" type="numeric" required="true">
        <cfargument name="userid" type="numeric" required="true">
        <cfargument name="hide_completed" type="string" required="true">
        
        <cfquery result="result" name="notsActive">
            SELECT
                n.notID,
                n.actionID,
                n.userID,
                n.suID,
                n.notTimeStamp,
                n.notStartDate,
                n.notEndDate,
                n.notStatus,
                n.notNotes,
                f.systemID,
                f.contactID,
                f.suTimeStamp,
                f.suStartDate,
                f.suEndDate,
                f.suStatus,
                f.suNotes,
                a.actionID,
                a.actionNo,
                a.actionDetails,
                a.actionTitle,
                a.navToURL,
                au.actionDaysNo,
                au.actionDaysRecurring,
                a.actionNotes,
                a.actionInfo,
                l.actionlinkid,
                l.BtnName,
                l.ActionLinkURL,
                l.endlink,
                l.targetlink,
                n.ispastdue,
                ns.checktype,
                ns.delstart,
                ns.delend,
                ns.status_color
            FROM funotifications n
            INNER JOIN fusystemusers f ON f.suID = n.suID
            INNER JOIN fusystems s ON s.systemID = f.systemID
            INNER JOIN fuactions a ON a.actionID = n.actionID
            INNER JOIN actionusers au ON a.actionID = au.actionID
            INNER JOIN fuActionLinks l ON l.actionlinkid = a.actionlinkid
            INNER JOIN notstatuses ns ON ns.notstatus = n.notStatus
            WHERE f.contactID = <cfqueryparam value="#arguments.currentid#" cfsqltype="cf_sql_integer">
              AND f.suID = <cfqueryparam value="#arguments.sysActiveSuid#" cfsqltype="cf_sql_integer">
              AND au.userID = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
              AND n.notStartDate IS NOT NULL
              AND DATE(n.notStartDate) <= <cfqueryparam value="#DateFormat(Now(), 'yyyy-mm-dd')#" cfsqltype="cf_sql_date">
            <cfif arguments.hide_completed is "Y">
              AND n.notStatus NOT IN ('Completed', 'Skipped')
            </cfif>
            ORDER BY FIELD(n.notStatus, 'Pending', 'Completed', 'Skipped'), n.notEndDate
        </cfquery>
        
        <cfreturn notsActive>
    </cffunction>

<cffunction output="false" name="SELfunotifications_24709" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    

    <cfquery name="result">
        SELECT 
            s.Systemtype, n.notID, n.actionID, n.userID, n.suID, n.notTimeStamp, 
            n.notStartDate, n.notEndDate, n.notStatus, n.notNotes, f.systemID, 
            f.contactID, f.suTimeStamp, f.suStartDate, f.suEndDate, f.suStatus, 
            f.suNotes, a.actionID, a.actionNo, a.actionDetails, a.actionTitle, 
            a.navToURL, au.actionDaysNo, au.actionDaysRecurring, a.actionNotes, 
            a.actionInfo, l.actionlinkid, l.BtnName, l.ActionLinkURL, l.endlink,
            l.targetlink, n.ispastdue, ns.checktype, ns.delstart, ns.delend,
            ns.status_color, c.recordname
        FROM 
            funotifications n
        INNER JOIN 
            fusystemusers f ON f.suID = n.suID
        INNER JOIN 
            fusystems s ON s.systemID = f.systemID
        INNER JOIN 
            fuactions a ON a.actionID = n.actionID
        INNER JOIN 
            actionusers au ON a.actionID = au.actionID
        INNER JOIN 
            fuActionLinks l ON l.actionlinkid = a.actionlinkid
        INNER JOIN 
            notstatuses ns ON ns.notstatus = n.notStatus
        INNER JOIN 
            contactdetails c ON c.contactid = f.contactid
        WHERE 
            au.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER"> 
            AND c.userid = au.userid 
            AND n.notstartdate IS NOT NULL 
            AND DATE(n.notstartdate) <= <cfqueryparam value="#DateFormat(Now(),'yyyy-mm-dd')#" cfsqltype="CF_SQL_DATE"> 
            AND n.notstatus = <cfqueryparam value="Pending" cfsqltype="CF_SQL_VARCHAR">
        ORDER BY 
            s.systemtype, n.notstartdate
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction output="false" name="INSnotifications" access="public" returntype="numeric">
    <cfargument name="new_contactname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">

    <cfquery result="result">
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

</cffunction>
<cffunction output="false" name="INSnotifications_23830" access="public" returntype="numeric">
    <cfargument name="new_contactname" type="string" required="true">
    <cfargument name="contactid" type="numeric" required="true">

    <cfquery result="result">
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
            <cfqueryparam value="#userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="/app/contact/?contactid=#arguments.contactid#&t4=1" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="Maintenance System Created!" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="System Added" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
        )
    </cfquery>
 </cffunction>

<cffunction output="false" name="INSnotifications_23937" access="public" returntype="numeric">
    <cfargument name="new_contactname" type="string" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="sunotes" type="string" required="true">

    <cfquery result="result">
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
</cffunction>
<cffunction output="false" name="UPDnotifications" access="public" returntype="void">
    <cfargument name="notificationId" type="numeric" required="true">

    <cfquery result="result" name="updateQuery">
        UPDATE notifications 
        SET `read` = 1 
        WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.notificationId#">
    </cfquery>
</cffunction>

<cffunction output="false" name="UPDnotifications_24009" access="public" returntype="void">
    <cfargument name="userid" type="numeric" required="true">

        <cfquery result="result" >
            UPDATE notifications 
            SET trash = 1 
            WHERE userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#"> 
            AND trash = 0
        </cfquery>
        
</cffunction>

<cffunction output="false" name="getRemindersTotal" access="public" returntype="numeric">
    <cfargument name="userID" type="numeric" required="true">
    <cfset var remindersTotal = 0>
        <cfset var currentStartDate = DateFormat(Now(), 'yyyy-mm-dd')>

        <cfquery result="result" name="reminders" >
            SELECT count(*) AS reminderstotal
            FROM funotifications n
            INNER JOIN fusystemusers f ON f.suID = n.suID
            INNER JOIN fusystems s ON s.systemID = f.systemID
            INNER JOIN fuactions a ON a.actionID = n.actionID
            INNER JOIN actionusers au ON a.actionID = au.actionID
            INNER JOIN fuActionLinks l ON l.actionlinkid = a.actionlinkid
            INNER JOIN notstatuses ns ON ns.notstatus = n.notStatus
            INNER JOIN contactdetails c ON c.contactid = f.contactid
            WHERE au.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            AND c.userid = au.userid
            AND n.notstartdate IS NOT NULL
            AND DATE(n.notstartdate) <= <cfqueryparam value="#currentStartDate#" cfsqltype="CF_SQL_DATE">
            AND n.notstatus = 'Pending'
        </cfquery>

        <cfset remindersTotal = reminders.reminderstotal>

    <cfreturn remindersTotal>
</cffunction>

<cffunction output="false" name="SELnotifications" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    

        <cfquery name="result" >
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
        
    
    <cfreturn result>
</cffunction>

<cffunction output="false" name="SELfunotifications_24639" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    
    

        <cfquery name="result" >
            SELECT count(*) as nots_total
            FROM funotifications n
            INNER JOIN fusystemusers f ON f.suID = n.suID
            INNER JOIN fusystems s ON s.systemID = f.systemID
            INNER JOIN fuactions a ON a.actionID = n.actionID
            INNER JOIN actionusers au ON a.actionID = au.actionID
            INNER JOIN fuActionLinks l ON l.actionlinkid = a.actionlinkid
            INNER JOIN notstatuses ns ON ns.notstatus = n.notStatus
            INNER JOIN contactdetails c ON c.contactid = f.contactid
            WHERE au.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND c.userid = au.userid
            AND n.notstartdate IS NOT NULL
            AND DATE(n.notstartdate) <= <cfqueryparam value="#DateFormat(Now(), 'yyyy-mm-dd')#" cfsqltype="CF_SQL_DATE">
            AND n.notstatus = <cfqueryparam value="Pending" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        

    <cfreturn result>
</cffunction>

<cffunction output="false" name="SELnotifications_24351" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    
    

        <cfquery name="result" >
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

    <cfreturn result>
</cffunction>
    <cffunction output="false" name="getNotificationsByBatchlist" access="public" returntype="query"  hint="Fetch notifications by batchlist">
        <cfargument name="batchlist" type="string" required="true" hint="Comma-separated list of notification IDs"/>

        <cfquery result="result" name="qNotifications" >
            SELECT n.notID
            FROM funotifications n
            WHERE n.notid IN (#arguments.batchlist#)
        </cfquery>

        <cfreturn qNotifications>
    </cffunction>

</cfcomponent>
