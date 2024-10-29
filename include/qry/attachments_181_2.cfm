
<cftry>
    <cfset attachmentsService = createObject("component", "/services/AttachmentService")>
    <cfset attachments = attachmentsService.getAttachmentsByNoteId(new_noteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in attachments_181_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
