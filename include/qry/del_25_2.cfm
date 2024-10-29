
<cftry>
    <cfset attachmentService = createObject("component", "/services/AttachmentService")>
    <cfset attachmentService.updateAttachmentIsDeleted(attachid=attachid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_25_2.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the attachment." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
