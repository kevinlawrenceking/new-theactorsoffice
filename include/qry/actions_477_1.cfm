<!--- This page retrieves and displays actions associated with a specific user from the database --->
<cfquery name="actions">
    <!--- Select relevant fields from the database for actions associated with the user --->
    SELECT 
        au.id,
        s.systemID,
        s.systemName,
        s.SystemType,
        s.SystemScope,
        s.SystemDescript,
        s.SystemTriggerNote,
        a.actionID,
        a.actionNo,
        a.actionDetails,
        a.actionTitle,
        a.navToURL,
        au.actionDaysNo,
        au.actionDaysRecurring,
        a.actionNotes,
        a.actionInfo
    FROM 
        fusystems s
    INNER JOIN 
        fuactions a ON s.systemid = a.systemid
    INNER JOIN 
        actionusers au ON au.actionid = a.actionid
    WHERE 
        au.userid = #userid#
    ORDER BY 
        a.actionNo
</cfquery>
