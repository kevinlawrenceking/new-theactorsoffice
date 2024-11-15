<!--- This ColdFusion page retrieves the title and component name for a specific page based on the provided page ID. --->
<cfquery name="FindModalTitle">
    <!--- Query to select the page title and component name from the database --->
    SELECT 
        p.pgTitle,
        c.compname
    FROM 
        pgpages p
    INNER JOIN 
        pgcomps c ON c.compID = p.compID
    INNER JOIN 
        pgapps a ON a.appID = c.appid
    WHERE 
        p.pgid = #rpgid#
</cfquery>
