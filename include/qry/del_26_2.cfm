<!--- This ColdFusion page updates the isdeleted status of an attachment in the attachments_tbl based on the provided attachid. --->

<cfquery name="del">
    <!--- Update the isdeleted status of the attachment to 1 (deleted) based on the attachid. --->
    UPDATE attachments_tbl 
    SET isdeleted = 1 
    WHERE attachid = #attachid#
</cfquery>
