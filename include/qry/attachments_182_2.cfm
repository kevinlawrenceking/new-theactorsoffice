<!--- This ColdFusion page retrieves attachment details for a specific note based on the note ID. --->
<cfquery name="attachments">
    <!--- Select attachment details from the attachments table for the given note ID --->
    SELECT
        attachid,
        noteid,
        attachname,
        attachfilename,
        userid
    FROM 
        attachments
    WHERE 
        noteid = #new_noteid#
</cfquery>
