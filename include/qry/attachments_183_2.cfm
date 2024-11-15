<!--- This ColdFusion page retrieves attachment details for a specific note based on the note ID. --->
<cfquery name="attachments">
    <!--- Query to select attachment details from the attachments table based on the note ID. --->
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
