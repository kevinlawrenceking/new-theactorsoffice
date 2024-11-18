<!--- This ColdFusion page retrieves user-specific tags from the database and orders them by tag name. --->

<cfquery name="tags">
    <!--- Query to select tag ID and tag name for the logged-in user from the tags_user table. --->
    SELECT tagid, tagname 
    FROM tags_user 
    WHERE userid = #userid# 
    ORDER BY tagname
</cfquery>
