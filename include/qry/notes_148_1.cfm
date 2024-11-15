<!--- This ColdFusion page retrieves a specific note from the noteslog table based on the provided noteid. --->

<cfquery name="notes">             
    SELECT * 
    FROM noteslog 
    WHERE noteid = #noteid# 
</cfquery>
