<!--- This ColdFusion page retrieves a specific note from the noteslog table based on the provided noteid. --->

<cfquery name="notes">             
    <!--- Query to select all fields from noteslog where the noteid matches the provided value. --->
    SELECT * 
    FROM noteslog 
    WHERE noteid = #noteid#
</cfquery>
