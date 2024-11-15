<!--- This ColdFusion page retrieves details from the noteslog table based on a specific note ID. --->

<cfquery name="details">       
    <!--- Query to select all records from noteslog where the note ID matches the provided noteid variable. --->
    SELECT * 
    FROM noteslog 
    WHERE noteid = #noteid# 
</cfquery>
