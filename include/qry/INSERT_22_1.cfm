
<cftry>
    <cfset variables.attachmentService = createObject("component", "services.AttachmentService")>
    <cfset variables.attachmentService.INSattachments(
        attachname = attachname,
        attachfilename = attachfilename,
        noteid = noteid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in INSERT_22_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
