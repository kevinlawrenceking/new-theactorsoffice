<cfcomponent displayname="NotificationStatusService" hint="Handles operations for NotificationStatus table" output="false"> 
<cffunction name="SELnotstatuses" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">
    <cfargument name="sysActiveSuid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cfquery name="result">
        SELECT 
            n.notID, n.actionID, n.userID, n.suID, n.notTimeStamp, 
            n.notStartDate, n.notEndDate, 'Future' AS notStatus, 
            n.notNotes, f.systemID, f.contactID, f.suTimeStamp, 
            f.suStartDate, f.suEndDate, f.suStatus, f.suNotes, 
            a.actionID, a.actionNo, a.actionDetails, a.actionTitle, 
            a.navToURL, au.actionDaysNo, au.actionDaysRecurring, 
            a.actionNotes, a.actionInfo, l.actionlinkid, l.BtnName, 
            l.ActionLinkURL, l.endlink, l.targetlink, n.ispastdue,
            ns.checktype, ns.delstart, ns.delend, ns.status_color
        FROM 
            notstatuses ns,
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
        WHERE 
            f.contactID = <cfquery result="result" param value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER"> AND
            f.suid = <cfquery result="result" param value="#arguments.sysActiveSuid#" cfsqltype="CF_SQL_INTEGER"> AND
            au.userid = <cfquery result="result" param value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> AND
            (n.notstartdate IS NULL OR DATE(n.notstartdate) >= <cfquery result="result" param value="#DateFormat(Now(),'yyyy-mm-dd')#" cfsqltype="CF_SQL_DATE">) AND
            n.notstatus = <cfquery result="result" param value="Pending" cfsqltype="CF_SQL_VARCHAR"> AND
            ns.notstatus = <cfquery result="result" param value="Future" cfsqltype="CF_SQL_VARCHAR">
    </cfquery>
    
    <cfreturn result>
</cffunction></cfcomponent>