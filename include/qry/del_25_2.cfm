
<cftry>
    <cfset componentPath = "/services/AttachmentService.cfc">
    <cfset attachmentService = createObject("component", componentPath)>
    <cfset result = attachmentService.updateattachments(attachid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in del_25_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
