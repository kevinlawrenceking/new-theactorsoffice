<!--- This ColdFusion page retrieves active system user information for a specific contact and user from the database. --->

<cfquery name="ru">       
    <!--- Query to select active system user details for the given contact and user ID --->
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
        fc.contactID = #currentid# 
        AND fc.userID = #userid# 
        AND fc.sustatus = 'Active'
</cfquery>
