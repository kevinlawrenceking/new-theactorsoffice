<cfcomponent displayname="NotificationService" hint="Handles operations for Notification table" > 

<cffunction name="removenotdups" access="public" returntype="void" output="false">
    <cfquery name="findDuplicates">
        SELECT 
            MIN(notid) AS new_notid,
            actionid,
            userid,
            suid
        FROM 
            funotifications
        GROUP BY 
            actionid, userid, suid
        HAVING 
            COUNT(*) > 1
        ORDER BY 
            actionid, userid, suid
    </cfquery>

    <cfloop query="findDuplicates">
        <cfquery>
            UPDATE funotifications_tbl
            SET isdeleted = 1
            WHERE notid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#findDuplicates.new_notid#">
        </cfquery>
    </cfloop>
</cffunction>




<cffunction name="UPDfunotifications_24032" access="public" returntype="void" output="false">
    <cfargument name="new_notstartdate" type="date" required="true">
    <cfargument name="notid" type="numeric" required="true">

    <cfquery >
        UPDATE funotifications
        SET 
            notstartdate = <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.new_notstartdate#">
        WHERE 
            notid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.notid#">
    </cfquery>
</cffunction>


<cffunction output="false" name="UPDfunotifications_24130" access="public" returntype="void">
    <cfquery name="result">
        UPDATE funotifications_tbl 
        SET isdeleted = 1 
        WHERE isdeleted = 0 
        AND suid NOT IN (SELECT suid FROM fusystemusers)
    </cfquery>
</cffunction>


<cffunction output="false" name="UPDfunotifications_23823" access="public" returntype="void">
    <cfargument name="notid" type="numeric" required="true">
    <cfargument name="notendDate" type="date" required="true">

    <cfquery>
        UPDATE funotifications
        SET 
            notStatus = <cfqueryparam value="Skipped" cfsqltype="CF_SQL_VARCHAR">,
            notenddate = <cfqueryparam value="#arguments.notendDate#" cfsqltype="CF_SQL_DATE">
        WHERE 
            notid = <cfqueryparam value="#arguments.notid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>


<cffunction name="SELfunotifications_24713" access="public" output="false" returntype="query">
    <cfargument name="newsuid" type="numeric" required="true">

    <cfquery name="result">
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
            n.ispastdue, 
            ns.checktype, 
            ns.delstart, 
            ns.delend, 
            ns.status_color 
        FROM 
            funotifications n 
        INNER JOIN 
            fusystemusers f ON f.suID = n.suID 
        INNER JOIN 
            fuactions a ON a.actionID = n.actionID 
        INNER JOIN 
            actionusers au ON a.actionID = au.actionID 
        INNER JOIN 
            notstatuses ns ON ns.notstatus = n.notStatus 
        WHERE 
            n.suID = <cfqueryparam value="#arguments.newsuid#" cfsqltype="CF_SQL_INTEGER"> 
            AND au.userID = f.userID 
            AND n.notStatus = 'Pending' 
            AND n.notStartDate IS NULL 
        ORDER BY 
            au.actionDaysNo, a.actionID
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="UPDfunotifications_23831" access="public" output="false" returntype="void">
    <cfargument name="notid" type="numeric" required="true">
    <cfargument name="notendDate" type="date" required="false" default="">
    <cfargument name="notstatus" type="string" required="false" default="">

    <!--- Update notification --->
    <cfquery name="addNotification">
        UPDATE funotifications
        SET 
            notStatus = <cfqueryparam value="#arguments.notstatus#" cfsqltype="CF_SQL_VARCHAR" maxlength="50">
            <cfif arguments.notstatus EQ "Completed" OR arguments.notstatus EQ "Skipped">
                , notenddate = <cfqueryparam value="#arguments.notendDate#" cfsqltype="CF_SQL_DATE" null="#NOT len(trim(arguments.notendDate))#">
            </cfif>
        WHERE notid = <cfqueryparam value="#arguments.notid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction name="UPDfunotifications" access="public" output="false" returntype="void">
    <cfargument name="notid" type="numeric" required="true">
    <cfargument name="notendDate" type="date" required="true">

    <cfquery>
        UPDATE funotifications
        SET 
            notStatus = 'Completed',
            notenddate = <cfqueryparam value="#arguments.notendDate#" cfsqltype="CF_SQL_DATE">
        WHERE 
            notid = <cfqueryparam value="#arguments.notid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>


<cffunction name="DETfunotifications" access="public" output="false" returntype="query">
    <cfargument name="notid" type="numeric" required="true">

    <cfquery name="result">
        SELECT 
            su.contactid, 
            su.userid, 
            n.notid, 
            s.systemid, 
            s.systemscope AS newsystemscope, 
            n.actionid, 
            su.suID AS newsuid, 
            au.actionDaysRecurring, 
            a.uniquename, 
            a.IsUnique, 
            u.recordname AS new_contactname
        FROM 
            funotifications n
        INNER JOIN 
            fusystemusers su ON su.suid = n.suid
        INNER JOIN 
            contactdetails c ON c.contactID = su.contactid
        INNER JOIN 
            fusystems s ON s.systemID = su.systemID
        INNER JOIN 
            actionusers au ON au.actionid = n.actionid
        INNER JOIN 
            fuactions a ON a.actionid = au.actionid
        INNER JOIN 
            taousers u ON u.userid = n.userid
        WHERE 
            n.notID = <cfqueryparam value="#arguments.notid#" cfsqltype="CF_SQL_INTEGER">
            AND au.userid = n.userid
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="INSfunotifications_23941" access="public" returntype="numeric" output="false" hint="Adds a notification to the database">
        <cfargument name="new_actionid" type="numeric" required="true" hint="The action ID for the notification">
        <cfargument name="new_userid" type="numeric" required="true" hint="The ID of the user">
        <cfargument name="NewSuid" type="numeric" required="true" hint="The suID for the notification">
        <cfargument name="notstartdate" type="date" required="true" hint="The start date of the notification">
        <cfargument name="sunotes" type="string" required="true" hint="Notes">

        <cfquery  name="addNotificationQuery" result="result">
            INSERT INTO funotifications (actionid, userid, suID, notstartdate, notstatus, notNotes)
            VALUES (
                <cfqueryparam value="#arguments.new_actionid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.NewSuid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#DateFormat(arguments.notStartDate, 'yyyy-mm-dd')#" cfsqltype="CF_SQL_DATE">,
                <cfqueryparam value="Pending" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.sunotes#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>

        <cfreturn result.generatedKey>
    </cffunction>

    <cffunction name="INSfunotifications_23940" access="public" returntype="numeric" output="false" hint="Adds a notification to the database">
        <cfargument name="new_actionid" type="numeric" required="true" hint="The action ID for the notification">
        <cfargument name="new_userid" type="numeric" required="true" hint="The ID of the user">
        <cfargument name="NewSuid" type="numeric" required="true" hint="The suID for the notification">
        <cfargument name="notstartdate" type="date" required="true" hint="The start date of the notification">
        <cfargument name="sunotes" type="string" required="true" hint="Notes">

        <cfquery  name="addNotificationQuery" result="result">
            INSERT INTO funotifications (actionid, userid, suID, notstartdate, notNotes)
            VALUES (
                <cfqueryparam value="#arguments.new_actionid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.NewSuid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#DateFormat(arguments.notStartDate, 'yyyy-mm-dd')#" cfsqltype="CF_SQL_DATE">, 
                <cfqueryparam value="#arguments.sunotes#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>

        <cfreturn result.generatedKey>
    </cffunction>


<cffunction name="INSfunotifications" access="public" returntype="struct" output="false" hint="Adds a notification to the database">
        <cfargument name="actionID" type="numeric" required="true" hint="The action ID for the notification">
        <cfargument name="userID" type="numeric" required="true" hint="The ID of the user">
        <cfargument name="suID" type="numeric" required="true" hint="The suID for the notification">
        <cfargument name="notStartDate" type="date" required="true" hint="The start date of the notification">

        <!--- Define local variable for query result --->
        <cfset var result = structNew()>

        <cfquery  name="addNotificationQuery" result="result">
            INSERT INTO funotifications (actionid, userid, suID, notstartdate, notstatus)
            VALUES (
                <cfqueryparam value="#arguments.actionID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.suID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#DateFormat(arguments.notStartDate, 'yyyy-mm-dd')#" cfsqltype="CF_SQL_DATE">,
                <cfqueryparam value="Pending" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>

        <cfreturn result.generatedKey>
    </cffunction>

<cffunction  output="false" name="UPDfunotifications_24316" access="public" returntype="void">
    <cfargument name="suid" type="numeric" required="true">
    
    <cfquery  name="close2">
        UPDATE funotifications
        SET isdeleted = 1
        WHERE suid = <cfqueryparam value="#arguments.suid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cffunction>

<cffunction  output="false" name="fetchNotifications" access="public" returntype="void" hint="Marks orphaned notifications as deleted.">
   <cfargument name="userid" type="numeric" required="true">
    <cfquery name="del" >
       UPDATE funotifications_tbl 
        SET isdeleted = 1 
        WHERE isdeleted = 0  
          AND userID = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
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
            `read`
        ) VALUES (
            <cfqueryparam value="Maintenance system created for #arguments.new_contactname#" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value="/app/contact/?contactid=#arguments.contactid#&t4=1" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="Maintenance System Created!" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="System Added" cfsqltype="CF_SQL_VARCHAR">,
            <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
            <cfqueryparam value=0 cfsqltype="CF_SQL_BIT">
        )
    </cfquery>
       <cfreturn result.generatedKey>
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
            `read`
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
           <cfreturn result.generatedKey>
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
            `read`,
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
           <cfreturn result.generatedKey>
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
                AND n.`read` = 0 
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
                n.`read`, 
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
