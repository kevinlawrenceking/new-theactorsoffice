<!--- This ColdFusion page retrieves user details from the database based on the provided suid. --->

<cfquery name="reldetails">
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
        fc.suid = #suid#
</cfquery>
