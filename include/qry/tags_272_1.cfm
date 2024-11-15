<!--- This ColdFusion page retrieves user tags from the database based on the user ID and orders them by tag name. --->

<cfquery name="tags">
    <!--- Query to select all tags for a specific user ordered by tag name --->
    SELECT * 
    FROM tags_user 
    WHERE userid = #userid# 
    ORDER BY tagName
</cfquery>
