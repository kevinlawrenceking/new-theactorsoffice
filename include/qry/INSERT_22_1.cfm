
<cftry>
    <cfset variables.attachmentService = new "/services/AttachmentService.cfc"()>
    <cfset variables.attachmentService.insertAttachment(
        attachname = attachname,
        attachfilename = attachfilename,
        noteid = noteid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in INSERT_22_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
