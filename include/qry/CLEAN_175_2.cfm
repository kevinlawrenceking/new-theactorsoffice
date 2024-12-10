<!--- This ColdFusion page updates the noteslog table to remove specific input elements from the NOTEDETAILSHTML field. --->

<cfquery name="CLEAN">
    <!--- Update the noteslog table to remove specific input elements from NOTEDETAILSHTML --->
    UPDATE noteslog 
    SET NOTEDETAILSHTML = REPLACE(
        NOTEDETAILSHTML, 
        '<input type="text" data-formula="e=mc^2" data-link="https://quilljs.com" data-video="Embed URL" />', 
        ''
    )
    WHERE NOTEDETAILSHTML LIKE '%<input type="text" data-formula="e=mc^2" data-link="https://quilljs.com" data-video="Embed URL" />%'
</cfquery>
