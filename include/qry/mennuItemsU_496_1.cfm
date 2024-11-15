<!--- This page retrieves and displays menu items for owner 'U' that are visible and not part of app ID 3 --->

<cfquery name="mennuItemsU">
    <!--- Query to get menu items for owner 'U' that are visible and not part of app ID 3 --->
    SELECT
        c.compID,
        c.compName,
        c.compIcon,
        c.compOwner,
        c.menuYN,
        c.compDir,
        c.menuOrder
    FROM 
        pgcomps c
    WHERE 
        c.menuYN = 'Y'
        AND compOwner = 'U'
        AND c.appid <> 3
    ORDER BY 
        c.menuOrder
</cfquery>
