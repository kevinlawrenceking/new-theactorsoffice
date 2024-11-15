<!--- This ColdFusion page inserts a new record into the audPlatforms_user_tbl for a specific user with a custom platform --->
<cfquery name="insert" result="resultx">
    <!--- Insert a new record into the audPlatforms_user_tbl --->
    INSERT INTO audPlatforms_user_tbl (audPlatform, userid)
    VALUES ('#CustomPlatform#', #userid#)
</cfquery>
