<!--- This ColdFusion page retrieves notifications and related action details for a specific user. --->
<cfinclude template="/include/qry/notsNext_514_1.cfm" />

<cfoutput>
    <!--- Save the query as a string for later use. --->
    <cfsavecontent variable="zquery">
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
            n.suid = #newsuid#
            AND au.userid = f.userid
            AND n.notstatus = 'Pending'
            AND n.notStartDate IS NULL
        ORDER BY
            au.actionDaysNo, a.actionid
    </cfsavecontent>
    
    <!--- Store the query string in the session. --->
    <cfset session.zquery = zquery />
</cfoutput>

