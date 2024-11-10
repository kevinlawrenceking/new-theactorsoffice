<cfset attachmentService = createObject("component", "services.AttachmentService")>
<cfset attachmentService.INSattachments(
    attachname = attachname,
    attachfilename = attachfilename,
    noteid = noteid
)>