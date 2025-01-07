<cfset notificationStatusService = createObject("component", "services.NotificationStatusService")>
<cfset notsInactive = notificationStatusService.SELnotstatuses(
    currentid = currentid,
    sysActiveSuid = sysActive.suid,
    userid = userid
)>

<cfoutput>
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
        f.contactID = #currentid# AND
        f.suid = #sysActive.suid# AND
        au.userid = #userid# AND
        (n.notstartdate IS NULL OR DATE(n.notstartdate) >= '#DateFormat(Now(), 'yyyy-mm-dd')#') AND
        n.notstatus = 'Pending' AND
        ns.notstatus = 'Future'
</cfoutput><Cfabort>