<cfcomponent displayname="NotificationService" hint="Handles operations for Notification table" output="false"> 

<cffunction name="SELfunotifications_24709" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfset var result = "">

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

<cffunction name="INSnotifications" access="public" returntype="void">
    <cfargument name="new_contactname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">

    <cfquery>
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

<cffunction name="INSnotifications_23830" access="public" returntype="void">
    <cfargument name="new_contactname" type="string" required="true">
    <cfargument name="contactid" type="numeric" required="true">

    <cfquery>
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
</cffunction>

<cffunction name="INSnotifications_23937" access="public" returntype="void">
    <cfargument name="new_contactname" type="string" required="true">
    <cfargument name="new_userid" type="numeric" required="true">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="sunotes" type="string" required="true">

    <cfquery>
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

<cffunction name="UPDnotifications" access="public" returntype="void">
    <cfargument name="notificationId" type="numeric" required="true">

    <cfquery name="updateQuery">
        UPDATE notifications 
        SET `read` = 1 
        WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.notificationId#">
    </cfquery>
</cffunction>

<cffunction name="UPDnotifications_24009