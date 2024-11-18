<!--- This ColdFusion page retrieves user-specific tags from the database for display purposes. --->

<cfquery name="tags">
    <!--- Query to select tag ID and tag name for the logged-in user from the tags_user table, ordered by tag name. --->
    SELECT 
        tagid, 
        tagname 
    FROM 
        tags_user 
    WHERE 
        userid = #userid# 
    ORDER BY 
        tagname
</cfquery>
