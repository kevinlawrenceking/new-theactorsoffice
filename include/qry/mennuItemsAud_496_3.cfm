<!--- This page retrieves and displays menu items for owner 'A' that are visible and part of app ID 3 --->

<cfquery name="mennuItemsAud">
    <!--- Query to get menu items for owner 'A' that are visible and part of app ID 3 --->
    SELECT
        c.compID,
        c.compName,
        c.compIcon,
        c.compOwner,
        c.menuYN,
        c.compDir,
        c.menuOrder
    FROM pgcomps c
    WHERE c.menuYN = 'Y'
        AND compOwner = 'A'
        AND c.appid = 3
    ORDER BY c.menuOrder
</cfquery>
