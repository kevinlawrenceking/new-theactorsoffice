<!--- This ColdFusion page inserts a new note into the noteslog table for a specific user and contact. --->

<cfquery name="InsertNote">
    <!--- Insert a new note into the noteslog table --->
    INSERT INTO noteslog (userid, contactid, noteDetails)
    VALUES (
        <cfqueryparam cfsqltype="cf_sql_integer" value="#userid#" />,
        <cfqueryparam cfsqltype="cf_sql_integer" value="#newcontactid#" />,
        <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#LEFT(trim(newnoteDetails), 2000)#" />
    )
</cfquery>
