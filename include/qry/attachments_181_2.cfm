
<cftry>
    <cfset attachments = createObject("component", "services.AttachmentService").getattachments(new_noteid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in attachments_181_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
